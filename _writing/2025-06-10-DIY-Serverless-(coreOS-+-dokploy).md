---
layout: post
title: "DIY Serverless (with coreOS + dokploy)"
date: 2025-06-10 08:00:00 -0700
---

The hosting landscape is a gradient between low-cost, high-maintenance and high-cost, low-maintenance. The sequence is roughly: full-on VPS => Heroku platform-as-a-service => containers alone (ie. Lightsail) => serverless functions (Vercel, Firebase, Cloudflare Workers).

Especially if you have a few projects kicking around that bring in minimal revenue, like me, it's useful to not pay a lot of overhead for a Heroku server each. Container services fall into this category too - 5+ bucks a month per container indefinitely makes you cull periodically.

On the other hand, if usage does spike, then serverless can become a cost-issue (Tweets documenting this are wide-spread), and you get walled into whichever walled garden is currently cool (Vercel, Firebase before it, etc).

Renting a cheap VPS, like from Hetzner, is great. But you need to know a minimum about server maintenance and backups.

I think modifying a VPS into a container service is a sweet spot of convenience and cost: load that VPS with a bomb-proof no-config OS like [coreOS](https://fedoraproject.org/coreos), and put [Dokploy](https://dokploy.com) on it for a no-fuss container service UI. It gives you the hassle-free experience of a Heroku-like platform, but with the cost and independence of a VPS.

But what about OS updates and security of the underlying OS? One of the main benefits of "serverless" like Firebase Functions or "container platforms" like AWS Lightsail is that you don't need to babysit an Ubuntu installation with automatic upgrades and OS updates. Limited, locked-down container-first OSs like CoreOS and Flatcar Linux solve this problem for you. You install them once, open/close the relevant ports in the Hetzner dash, and you're pretty much set-and-forget.

You only access Dokploy through the https dash, it itself runs in a container, and the OS automatically updates (with rollbacks) forever. You still back up your relevant data to an external S3 service (best-case on a separate cloud provider), to make things truly bomb-proof.

This way you can have your cake and eat it too: all of the benefits of serverless, with all of the benefits of running your own VPS.

--—
Caveat: if your traffic is super intermittent and spikey go for serverless functions. If you’re just starting out go with Heroku.
