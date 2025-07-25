---
layout: post
title: "DIY Serverless (with coreOS + dokploy)"
date: 2025-06-10 08:00:00 -0700
---

The hosting landscape is a gradient between low-cost, high-maintenance and high-cost, low-maintenance. The sequence is roughly: full-on VPS => Heroku platform-as-a-service => containers alone (ie. Lightsail) => serverless functions (Vercel, Firebase, Cloudflare Workers).

Problem 1: costs add up - Especially if you have a few projects kicking around that bring in minimal revenue, like me, it's useful to not pay a lot of overhead for a Heroku server each. Container services fall into this category too - 5+ bucks a month per container indefinitely makes you cull periodically.

Problem 2: costs can spike - On the other hand, if usage does spike, then serverless can become a cost-issue (Tweets documenting this are wide-spread), and you get walled into whichever walled garden is currently cool (Vercel, Firebase before it, etc).

Problem 3: maintenance - Renting a cheap VPS from someone like Hetzner or Digital Ocean is great. But you need to know a minimum about server maintenance and backups. What about OS updates and security of the underlying OS? What if something goes wrong with an automatic upgrade? One of the main benefits of "serverless" like Firebase Functions or "container platforms" like AWS Lightsail or Fargate is that you don't need to babysit an Ubuntu installation with automatic upgrades and OS updates.

A limited, locked-down container-first OSs like [coreOS](https://fedoraproject.org/coreos) or Flatcar Linux solve this problem for you. You install them once, open/close the relevant ports in the Hetzner dash, and you're pretty much set-and-forget. At its best, CoreOS provides a lot of the low-maintenance platform of PaaS, with all of the affordability and vendor neutrality of a VPS. We have an affordable server. Problem 1 and 2 are solved.

Problem 3 is only partially solved: Our server itself is a stable, secure, maintenance-free platform, but we still need to mess around with devops on it: what about all of the sweet maintenance-free devops features from PaaS like deploy from git, easy database deploys, and - you know - not having to mess around with Kubernetes for your side project? Here's where the second move comes in: [Dokploy](https://dokploy.com). Dokploy is your CI, builder from git, logging, env var manager, and UI around container orchestration. It's Heroku, but open-source. You only access Dokploy through https, removing a whole class of attacks. You still back up your relevant databases to an external storage service (best-case S3 on a separate cloud provider), to make things truly bomb-proof.

Dokploy itself runs in a container, and the the underlying OS automatically updates (with rollbacks) forever. I think modifying a VPS into a "container service" in this way is the sweet spot of convenience and cost: load that VPS with a bomb-proof no-config OS like coreOS, and put Dokploy on it for a no-fuss container service UI. It gives you the hassle-free experience of a Heroku-like platform, but with the cost and independence of a VPS.

This way you can have your cake and eat it too: most of the benefits of serverless, with most of the benefits of running your own VPS.

---

Caveat: if your traffic is super intermittent and spikey go for serverless functions. If you’re just starting out go with Heroku.
