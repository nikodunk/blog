---
layout: post
title:  "Mobile"
date:   2020-06-03 08:00:00 -0700
tags: ["Learnings", "Updates"]
---


## ![](/projects/logo_electrade.png) Electrade | A mobile marketplace for EVs

![](/projects/demo_electrade.gif)

<p >♜ <strong>Challenge:</strong> Mobile Marketplace for Electric Vehicle Leasing and Trading. Large, complex app with Stripe integration, photo upload and async operations</p>
<p >⚑ <strong>Solution:</strong> A simple app structure was shipped to multiple platforms and iterated on daily.</p>

	Team:
	* Armin (ideation, ops)
	* Niko (ideation, tech)

	Tech:
	* React Native on iOS & Android
	* Backend Node/Express/Postgres
	* Stripe payment processing
	* Listing photos upload to S3
	* Dynamic pricing data indexed from Autotrader, Edmunds with Puppeteer
	* EV News updates through APIfy.com



------------

## ![](/projects/logo_health.png) Soap Dictate App | Medical Note Transcription App

Soap dictate was built to help my friend Libo at Stanford Internal Medicine save time on note taking (aka medical charting or documentation) with a mobile app to dictate into templates.

Doctors currently spend around 2 hours a day after their shift typing up notes at the ward desktop, or catching up at home. This app enabled them to save at least an hour of this time by quickly dictating their notes into their phone during their shift, and making it very easy to copy-paste their notes into the EMR system once they’re done. The idea was to help physicians save an hour a day for $9.99 a month.

The app was actually downloaded by massage therapists, acupuncturists and psychotherapists, who wanted to export PDFs and emails, for $3.99 per month. Added a bunch of disclaimers – the HIPAA situation of Apple's Speech Recognition API is unclear as it's encrypted, but Apple won't sign a BAA – however usage and slow growth continues. If Apple one day agrees to sign a BAA for Speech Recognition then I could advertise and grow the app.

	Team
	* Libo (medical product advice)
	* Niko (product, tech)

	Tech
	* React Native App
	* Mobile Frontend in React Native with RNVoice library
	* Web Frontend in React at http://soapdictate.com (currently replaced with simple static site)
	* Backend in Node/Express/Postgresql backend running on Heroku (currently removed)


![](/projects/demo_soap.gif)



-----------



## ![](/projects/logo_health0.png) I Am Off! App | Off-day planner for Physicians

Together with Libo Wang and initially Steven Pease, we set out to help with the burn-out rate of doctors at Stanford Internal Medicine: This app helps doctors (who have irregular schedules and little free time) work out who’s off and up to hang out with a super simple calendaring app.

	Team
	* Libo W. (idea, product)
	* Niko D. (tech)

	Tech
	* Frontend in React Native/Redux
	* Backend in Node/Express/PostgreSQL running on Heroku

![](/projects/demo_iamoff.gif)
![](/projects/demo_iamoff.png)


-----------



## ![](/projects/logo_positivity.png) Positivity Trainer | Train your mind to be more positive

This is a very simple side-project, which I did to learn Firebase Auth and Storage. Tries to counteract the negative media coverage of everything we cover every day by asking you a positivity-inducing question, daily.

	Tech
	* React Native
	* Google Firebase Auth / Storage / Push Notifications

![](/projects/demo_positivity.jpg)



-----------
