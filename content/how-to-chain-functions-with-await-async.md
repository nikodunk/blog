---
layout: post
title:  "How to chain multiple functions in Javascript properly with await/async"
date:   2019-08-11 08:00:00 -0700
categories: 
---

Next to my main job of building out and running [electrade](https://www.electrade.app) I help a friend’s team with their project. Recently, we wanted to build a Craiglist-style anonymous email relay with a "serverless" Google Firebase Function (same as AWS Lambda, Azure Functions, etc) for this project. So far I've found handling async operations with `.then()` callbacks easier to think through, but wanted to use async/await here because it's so much cleaner to read. I found most articles out there on chaining multiple functions unhelpful as they tend to post incomplete demo code that's copy/pasted from MSDN. There are a few hard-to-debug pitfalls on async/await, and since I fell into all of them I'll post my complete code here and explain my learnings so you don't have to. 

Here's working code that chains multiple functions, waits for everything to resolve, and _then_ sends the result. Main mistakes were:

1. Every `async function myFunction(){ <your code here> }` declaration _automatically_ wraps the whole async function's code (ie. `<your code here>`) in a `new Promise`, and turns any `return x` within the code into `resolve(x)`. **But you still need to await** outside of it (ie. `let y = await myFunction()`) **or it won't actually wait**. The debugging around this is super annoying.
2. Side note – in cloud functions, you _must_ send a response with `res.send()`, or the function will assume it's failed and re-run it. This obviously must happen once everything has run or your promises will get cancelled.

The code below does 

* We have 2 normal sync functions `getFieldsFromRequest()` and `extractCourseIdFromEmailAddress()` – no issues here.
* Then we have `async` function `getEmailOfCourseWithCourseId()` which gets the course's email address from Firestore. We don't know how long getting stuff from Firestore will take so it's `async`, and will return (or resolve in promise parlance) the `courseEmail` we need to run the next 2 functions. 
* The next 2 functions, `saveToCloudFirestore()` and `sendEmailInSendgrid()`, _must not_ be run before `getEmailOfCourseWithCourseId()` is run and has returned `courseEmail`. If they do run too early, they will run with `courseEmail` as undefined and everything goes to shit. **By passing in `courseEmail`, and setting it where it is defined on line 12 to `await getEmailOfCourseWithCourseId()`**, these functions will wait until courseEmail is defined (aka the functions have run and their promises have resolved), then run.
* Finally, `res.send()` must not be sent until `saveToCloudFirestore()` and `sendEmailInSendgrid()` have been run and returned their values, otherwise our whole cloud function will interrupt before the work is done. For this, we save the `saveToCloudFireStore()` and `sendEmailInSendgrid()` responses (the stuff they return) into a variable _whose sole purpose is to mark when the above function as done_. This in a sense replaces a `.then()`: it waits till both of these variables (`savedToCloud` and `sentEmail`) "have arrived" (aka their Promise has been resolved), then runs `res.send()` with them.
* For readability's sake, I have **removed the try/catch wrappings** here that you should be doing in practice. You should never not catch errors, but removing them makes the async/await concept easier to understand.

{{< highlight javascript "linenos=table" >}}

// this is the cloud function you can call over HTTP. It is basically for email relay:
// it gets an email from sendgrid, parses the fields, looks up the real email with the courseId,
// saves to FireStore and sends and email with sendgrid.
// Finally, it sends a res.send() to end the cloud function

// {* import a bunch of shit *}

// main function
exports.emailFunction = functions.https.onRequest(async (req, res) => {
  let fields = getFieldsFromRequest(req); // sync
  let courseId = extractCourseIdFromEmailAddress(fields); // sync
  let courseEmail = await getEmailOfCourseWithCourseId(courseId); // async
  let savedToCloud = await saveToCloudFirestore(fields, courseEmail, courseId); // async
  let sentEmail = await sendEmailWithSendgrid(fields, courseEmail);  // async
  res.status(200).send(savedToCloud, sentEmail); // Once sentEmail and saveToCloud have been returned (aka promises have been resolved, aka their functions have been run), res.send() will run so Firebase/SendGrid know that func worked. 
});

// Helper functions below
function getFieldsFromRequest(req) { // sync
    let fields = readTheFieldsFromReqWithBusboy(req)
    return fields;
}

function extractCourseIdFromEmailAddress(fields) { // sync
    let courseId = fields.to.substring(0, fields.to.indexOf('@'));
    return courseId;
}

async function getEmailOfCourseWithCourseId(courseId) { // async important
    let courseData = await database.get(courseId)
    let courseEmail = courseData.email;
    return courseEmail; // due to function being labeled async above, this is the equivalent of wrapping the whole function in 'return new Promise(resolve) => {}' and then returning a 'resolve(result)'
}

async function sendEmailWithSendgrid(fields, courseEmail) { // async important
    let msg = {to: courseEmail, from: fields.from, text: fields.text}
    let sentEmail = await sendgrid.send(msg)
    return sentEmail; // due to function being labeled async above, this is the equivalent of wrapping the whole function in 'return new Promise(resolve) => {}' and then returning a 'resolve(result)'
}

async function saveToCloudFirestore(fields, courseEmail, courseId) { // async important
    let savedToCloud = await database.add(fields, courseEmail, courseId)
    return savedToCloud;
}


{{< / highlight >}}


Again, **wrap the 3 last async functions and the main function in try{}catch{} to catch errors**. Also, the database code cannot be copied over like this – it's just for illustrative purposes. You have been warned!


-----

[Korean Translation by Toast UI here](https://ui.toast.com/weekly-pick/ko_20190826/). Thanks guys!