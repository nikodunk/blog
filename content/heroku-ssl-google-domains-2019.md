---
layout: post
title:  "How to set up Heroku SSL (https) with Google Domains in 2021"
date:   2021-06-27 08:00:00 -0700
tags: ["Learnings"]
image: /accelerator/moneyshot1.jpg
---

Updated for 2021 - things got a little easier. 

Ugh. This wastes time every time I run into it. It's so much easier with AWS, and there's terrible and conflicting documentation out on the web about Heroku, Google Domains and Heroku's ACM for SSL. IF you do everything right, it's actually very simple. So I'll document how it worked for me in 2019 here as much for me as for anyone else.

This article is a "fork" of [David Gagne's great article here](https://medium.com/@david.gagne/set-up-a-custom-domain-for-your-heroku-application-using-google-domains-guaranteed-a2b2ff934f97), from which I got these steps and tweaked them slightly to update them. It's only 3 steps:


1. **Heroku, in your app > Settings > Add your domain:** 
	* Add www.[foo.com] (Note: www is KEY!) to your app 
	* Copy the [DNS Target] it gives you


2. **Google Domains > DNS > Resource records > Custom Records > Manage Custom Records:**
	* www, CNAME, [DNS Target]

	Now you're basically set up. If someone goes to https://www.[foo.com] in a few minutes, they'll see your Heroku app hosted at [DNS Target]. But if they go to any other permutation (http, non-www) they'll get a 404 error. To solve this, we'll set up permanent redirects to the main version in the next step.

3. **Google Domains > Website > Add a Forwarding Address:** 
	* From Field: [foo.com]
	* To Field: https://www.[foo.com]
	* Permanent Redirect (301)
	* Forward Path (so that [foo.com]/about forwards to https://www.[foo.com]/about)
	* SSL Enabled

Boom. Wait a couple minutes for DNS to catch up, and you're done.
	
	heroku certs:auto:refresh

In Terminal to refresh the SSL cert settings on Heroku, and check the Heroku Dashboard to confirm everything's working. 

Confirm all the below permutations forward to your site correctly:

https:
* https://www.[foo.com]
* https://[foo.com]

http:
* http://www.[foo.com] 
* http://[foo.com]

paths:
* https://www.[foo.com]/about
* http://[foo.com]/about

Have a great year!


PS: So does this work for the naked domain like [foo.com] instead of www.[foo.com]? No! Google Domains does not support ALIAS domains, and therefore in combination with Heroku does not support forwarding to the naked (aka. root aka. apex) domain. Sorry! This surprised me too :( [Source 1: Heroku Docs](https://help.heroku.com/NH44MODG/my-root-domain-isn-t-working-what-s-wrong) | [Source 2: StackOverflow](https://stackoverflow.com/questions/43197176/how-to-set-up-ssl-for-naked-domain-from-google-domains-to-heroku). Your only alternative here is to transfer your domain (costs money) to something like Cloudflare.