---
layout: post
title:  "How to set up Heroku SSL with Google Domains in 2019"
date:   2018-04-10 08:00:00 -0700
tags: ["Learnings"]
image: /accelerator/moneyshot1.jpg
---

Ugh. This wastes time every time I run into it. It's so much easier with AWS, and there's terrible and conflicting documentation out on the web about Heroku, Google Domains and Heroku's ACM for SSL. IF you do everything right, it's actually very simple. So I'll document how it worked for me in 2019 here as much for me as for anyone else.

I strongly reference [David Gagne's article](https://medium.com/@david.gagne/set-up-a-custom-domain-for-your-heroku-application-using-google-domains-guaranteed-a2b2ff934f97) here, which is now sometimes behind a paywall on Medium.


1) Heroku, in your app App > Settings: Add www.[your-domain].com (Note: www is KEY!) to your app and copy the [DNS Target] it gives you.
2) Google Domains > DNS > Synthetic Records: Add @ to Subdomain, add http://[your-domain].com to the next field. No need to mess around with the path forwarding radio, SSL radio and whatever else the web talks about – just leave it off.
3) Google Domains > DNS > Custom Resource Records: www, CNAME, [DNS Target]

Boom. Wait a couple minutes, and you're done.
	
	heroku certs:auto:refresh

In Terminal to refresh, and check the Heroku Dashboard to confirm it's working. 

I install [heroku-ssl-redirect](https://github.com/nodenica/node-heroku-ssl-redirect) for node to force HTTPS upgrades.

Have a great year!