---
layout: post
title:  "How to chain multiple functions with await/async"
date:   2019-08-11 08:00:00 -0700
categories: 
---

Recently I was helping a friend with Google Cloud Functions, which means you have to be very careful with the precision of your promises. So far I've been doing this with .then() callbacks, but wanted to use async/await because it's so much cleaner to read. There's a bunch of articles out there on this, but none of them really helped me as they post in a bunch of demo code.

Here's working code that chains multiple functions, waits for everything to resolve, and _then_ sends the result. Main mistakes were:

1. Every async function _needs a new Promise_, and needs to resolve(). **It won't complain if you don't do this, but it also won't actually wait**. The debugging around this is super annoying.
2. In cloud functions, you _must_ send a response with res.send(), or the function will assume it's failed and re-run it. This means you to make sure multiple functions resolve.

The code does:

* We have 2 sync functions (no issues here).
* Then we have async courseEmail which gets the course's email address from firebase. This is async, and will return (or resolve in promise parlance) the courseEmail we need to run the next 2 functions. The next 2 functions, savetoCloudFireStore() and sendEmailWithSendGrid() _must_ not be run before getAssociatedEmailOfcCourseWIthCourseId is run, or courseEmail is undefined and everything goes to shit. For this, the promise is important.
* Finally, res.send() must not be sent until saveToCloudFirestore() and sendEmailWithSendGrid() have been run, otherwise the cloud function will stop before the work is done. For this, we save the saveToCloudFireStore and sendEmailWithSendgrid's responses (the stuff they return) into a varialble _who's sole purpose is to mark when the above function is done_. Then we do a sweet little if statement, which is basically does the same thing as a .then() before – wait's till both of these variables (saveDonePromise and emailDonePromise) are defined then runs.

Code below.

{{< highlight javascript >}}

// this is the cloud function you can call over HTTP. It is basically for email relay:
// it gets an email from sendgrid, parses the fields, looks up the real email with the courseId,
// saves to FireStore and sends and email with sendgrid.
// Finally, it sends a res.send() to end the cloud function

// main function
exports.emailFunction = functions.https.onRequest(async (req, res) => {
  let fields = getFieldsFromRequest(req);                                          // sync
  let courseId = extractCourseIdFromEmailAddress(fields);                          // sync
  let courseEmail = await getAssociatedEmailOfCourseWithCourseId(courseId);        // async
  let savePromiseDone = await saveToCloudFirestore(fields, courseEmail, courseId); // async, will wait to run until courseEmail is defined
  let emailPromiseDone = await sendEmailInSendgrid(fields, courseEmail);           // async, will wait to run until courseEmail is defined
  if (savePromiseDone && emailPromiseDone) { res.send() }                          // sync, but will wait until emailDonePromise and saveDonePromise are defined.
});

// helper functions
function getFieldsFromRequest(req) {
  let fields = readTheFieldsFromReqWithBusboy(req)
  return fields;
}

function extractCourseIdFromEmailAddress(fields) {
  let courseId = doStuffToEmailAddress(fields)
  return courseId;
}

async function getAssociatedEmailOfCourseWithCourseId(courseId) { // async important
  return new Promise((resolve, reject) => { // important
    doAsyncStuffWithFirestore(courseId)
      .then(course => {
        resolve(course.email); // important
        return; // the return is only here because .then() callbacks need a return
      })
      .catch(error => console.log(error));
  });
}

async function sendEmailWithSendgrid(fields, courseEmail) { // async important
  return new Promise((resolve, reject) => { // important
    doAsyncStuffWithSendGrid(fields, courseEmail)
      .then(res => {
        resolve(msg); // important
        return; // the return is only here because .then() callbacks need a return
      })
      .catch(error => console.log(error));
  });
}

async function saveToCloudFirestore(fields, courseEmail, courseId) { // async important
  return new Promise((resolve, reject) => { // important
    doAsyncStuffWithFirestore(fields, courseEmail, courseId)
      .then(res => {
        resolve(res); // important
        return; // the return is only here because .then() callbacks need a return
      })
      .catch(error => console.log(error));
  });
}

{{< / highlight >}}