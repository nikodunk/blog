---
layout: post
title:  "How to set up Heroku SSL (HTTPS) with Google Domains in 2019"
date:   2019-02-16 08:00:00 -0700
tags: ["Learnings"]
image: /accelerator/moneyshot1.jpg
---

Ugh. This wastes time every time I run into it. It's so much easier with AWS, and there's terrible and conflicting documentation out on the web about Heroku, Google Domains and Heroku's ACM for SSL. IF you do everything right, it's actually very simple. So I'll document how it worked for me in 2019 here as much for me as for anyone else.

I strongly reference [David Gagne's article](https://medium.com/@david.gagne/set-up-a-custom-domain-for-your-heroku-application-using-google-domains-guaranteed-a2b2ff934f97) here, which is now sometimes behind a paywall on Medium. It's actually only 3 steps.


1. **Heroku, in your app > Settings > Add your domain:** Add www.[your-domain].com (Note: www is KEY!) to your app and copy the [DNS Target] it gives you.
2. **Google Domains > DNS > Synthetic Records > Add a subdomain:** @ to Subdomain, add https://www.[your-domain].com to the next field. Forward the path (so that [your-domain].com/about.html forwards to https://www.[your-domain].com/about.html), and leave the SSL Enabled.
3. **Google Domains > DNS > Custom Resource Records > Add a CNAME:** www, CNAME, [DNS Target]

Boom. Wait a couple minutes, and you're done.
	
	heroku certs:auto:refresh

In Terminal to refresh, and check the Heroku Dashboard to confirm it's working. 

I install [heroku-ssl-redirect](https://github.com/nodenica/node-heroku-ssl-redirect) for node to force HTTPS upgrades.

Have a great year!


PS: So does this work for simply [your-domain].com and not www.[your-domain].com as we were using in Step 1? No! Google Domains does not support ALIAS domains, and therefore in combination with Heroku does not support forwarding to the naked (aka. root aka. apex) domain. Sorry! This surprised me too :( [Source 1: Heroku Docs](https://help.heroku.com/NH44MODG/my-root-domain-isn-t-working-what-s-wrong) [Source 2: StackOverflow](https://stackoverflow.com/questions/43197176/how-to-set-up-ssl-for-naked-domain-from-google-domains-to-heroku)