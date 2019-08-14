---
layout: post
title:  "How to chain multiple functions properly with await/async"
date:   2019-08-11 08:00:00 -0700
categories: 
---

Next to my main job of building out and running [electrade](https://www.electrade.app) I help a friend’s team with their project. Recently, we wanted to build a Craiglist-style anonymous email relay with a "serverless" Google Firebase Function (same as AWS Lambda, Azure Functions, etc) for this project. So far I've found handling async operations with `.then()` callbacks easier to think through, but wanted to use async/await here because it's so much cleaner to read. I found most articles out there on chaining multiple functions unhelpful as they tend to post incomplete demo code that's copy/pasted from MSDN. There are a few hard-to-debug pitfalls on async/await, and since I fell into all of them I'll post my complete code here and explain my learnings so you don't have to. 

Here's working code that chains multiple functions, waits for everything to resolve, and _then_ sends the result. Main mistakes were:

1. Every async function _needs_ a `new Promise`, and needs to `resolve()`. **It won't complain if you don't do this, but it also won't actually wait**. The debugging around this is super annoying.
2. Side note – in cloud functions, you _must_ send a response with `res.send()`, or the function will assume it's failed and re-run it. This obviously must happen once everything has run or your promises will get cancelled.

The code below does 

* We have 2 normal sync functions `getFieldsFromRequest()` and `extractCourseIdFromEmailAddress()` – no issues here.
* Then we have `async` function `getEmailOfCourseWithCourseId()` which gets the course's email address from Firestore. We don't know how long getting stuff from Firestore will take so it's `async`, and will return (or resolve in promise parlance) the `courseEmail` we need to run the next 2 functions. 
* The next 2 functions, `saveToCloudFirestore()` and `sendEmailInSendgrid()`, _must not_ be run before `getEmailOfCourseWithCourseId()` is run and has returned `courseEmail`, or they will run with `courseEmail` as undefined and everything goes to shit. **By passing in `courseEmail` that is `await`ing the function `getEmailOfCourseWithCourseId()` above**, these functions (and the if operator) will wait until that has happened (aka promise has resolved), then run.
* Finally, `res.send()` must not be sent until `saveToCloudFirestore()` and `sendEmailInSendgrid()` have been run and returned their values, otherwise our whole cloud function will interrupt before the work is done. For this, we save the `saveToCloudFireStore()` and `sendEmailInSendgrid()` responses (the stuff they return) into a variable _who's sole purpose is to mark when the above function as done_. This in a sense replaces a `.then()`: it waits till both of these variables (`savedToCloud` and `sentEmail`) "have arrived" (aka their Promise has been resolved), then runs `res.send()` with them.


{{< highlight javascript >}}

// this is the cloud function you can call over HTTP. It is basically for email relay:
// it gets an email from sendgrid, parses the fields, looks up the real email with the courseId,
// saves to FireStore and sends and email with sendgrid.
// Finally, it sends a res.send() to end the cloud function

// {* import a bunch of shit *}

// main function
exports.emailFunction = functions.https.onRequest(async (req, res) => {
  let fields = getFieldsFromRequest(req); // sync
  let courseId = extractCourseIdFromEmailAddress(fields); // sync
  let courseEmail = await getEmailOfCourseWithCourseId(courseId, res); // async

  if (courseEmail) { // if operator (to check if courseEmail was valid) will wait to run until courseEmail has been returned
    let savedToCloud = await saveToCloudFirestore(fields, courseEmail, courseId);
    let sentEmail = await sendEmailWithSendgrid(fields, courseEmail); 
    res.send(savedToCloud, sentEmail); // sentEmail and saveToCloud have been returned (aka promises have been resolved), res.send() so Firebase/SendGrid know that func worked. 
  } else {
    res.send(400);
    console.log('bad courseId: ', courseId);
  }
});

// Helper methods below
function getFieldsFromRequest(req) {
  const busboy = new Busboy({ headers: req.headers });
  let fields = {};
  busboy.on('field', (field, val) => {
    fields[field] = val;
  });
  busboy.end(req.rawBody);
  return fields;
}

function extractCourseIdFromEmailAddress(fields) {
  let courseId = fields.to.substring(0, fields.to.indexOf('@'));
  return courseId;
}

async function getEmailOfCourseWithCourseId(courseId, res) { // async important
  try {
    let courseData = await doAsyncStuffWithFirestore(courseId)
    let courseEmail = courseData.email;
    return courseEmail; // due to function being labeled async above, this is the equivalent of wrapping the whole function in 'return new Promise(resolve) => {}' and then returning a 'resolve(result)'
    else{ return }
  } catch (error) {
    console.log(error);
  }
}

async function sendEmailWithSendgrid(fields, courseEmail) { // async important
  try {
    let msg = {to: courseEmail, from: fields.from, text: fields.text}
    let sent = await doAsyncStuffWithSendGrid(fields, courseEmail)
    return sent; // due to function being labeled async above, this is the equivalent of wrapping the whole function in 'return new Promise(resolve) => {}' and then returning a 'resolve(result)'
  } catch (error) {
    console.log(error);
  }
}

async function saveToCloudFirestore(fields, courseEmail, courseId) { // async important
  try {
    let writtenData = await doAsyncStuffWithFirestore(fields, courseEmail, courseId)
    return writtenData;
  } catch (error) {
    console.log(error);
  }
}


{{< / highlight >}}
