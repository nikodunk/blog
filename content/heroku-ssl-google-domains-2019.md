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
	* Add www.[your-domain].com (Note: www is KEY!) to your app 
	* Copy the [DNS Target] it gives you
2. **Google Domains > DNS > Custom Records > Manage Custom Records:** Enter
	* www, CNAME, [DNS Target]
3. **Google Domains > Website > Add a Forwarding Address:** 
	* Forward from [your-domain].com
	* Forward to https://www.[your-domain].com
	* Permanent Redirect (301)
	* Forward Path so that [your-domain].com/about forwards to https://www.[your-domain].com/about
	* Leave SSL Enabled

Boom. Wait a couple minutes, and you're done.
	
	heroku certs:auto:refresh

In Terminal to refresh, and check the Heroku Dashboard to confirm it's working. 

Make sure both https://www.your-domain.com, https://your-domain.com work, http://your-domain.com and http://www. forwards correctly, and http://your-domain.com/about forwards as well.

Have a great year!


PS: So does this work for simply [your-domain].com and not www.[your-domain].com as we were using in Step 1? No! Google Domains does not support ALIAS domains, and therefore in combination with Heroku does not support forwarding to the naked (aka. root aka. apex) domain. Sorry! This surprised me too :( [Source 1: Heroku Docs](https://help.heroku.com/NH44MODG/my-root-domain-isn-t-working-what-s-wrong) [Source 2: StackOverflow](https://stackoverflow.com/questions/43197176/how-to-set-up-ssl-for-naked-domain-from-google-domains-to-heroku)