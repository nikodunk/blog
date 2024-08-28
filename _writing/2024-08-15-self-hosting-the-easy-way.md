---
layout: post
title: "Self-hosting without becoming a devops expert"
date: 2024-08-15 08:00:00 -0700
categories:
---

Ever since Heroku turned off their free tier, many have been at a loss where to host small, hobby, or archived projects. Paying $12/mo for each one of them quickly adds up. I dislike modern Heroku alternatives like Render, Fly.io and others as they cost as much as Heroku, but are not as ergonomic in my opinion. 

Like many, I've recently discovered how far along "Heroku-like" solutions like Appliku and Coolify have come that add a layer of ergonomics onto a raw server/VPS (or even a Raspberry Pi if that floats your boat). 

Coolify lets me get the benefits of self-hosting my sites and apps on a VPS (cost savings, freedom, cost control), but allows me focus on building apps and features without fussing too much about ports, certificates, containerization (god forbid I go down a Kubernetes rabbit hole) and devops. 

There's two steps involved:

1.  Sign up at Hetzner.com (I used an arm instance) for $3/mo, and self-updating Fedora CoreOS (or normal Fedora though you'll need to set it to auto-update)
2.  Install [Coolify](https://coolify.io/self-hosted) with the one-liner and start donating $10/mo to thei project.

There is no step 3 - start deploying apps in docker containers (or more Heroku-like Nixpacks if you can get them to work) to your new small server. Follow a hardening tutorial and create snapshots of the server.

Coolify can create backups of your databases to the server itself (which you'll have to download to local) or to S3. You can layer in as many apps as you want until memory runs thin. Most apps won't see much traffic, and if you see spikes you can grow your instances or spin them out to a separate server ("VPS"). At 2 apps and 2 databases, I'm at 900mb/4096mb memory usage (including the OS).

I originally started researching solutions like [Kamal](https://kamal-deploy.org/) and Dokku, but for me these are a step too far into the "distraction" of devops. I love devops, and I will happily bikeshed and optimize my servers all day without getting any profitable/valuable work done. I need to keep myself away from these these choices and abstract them away. I need a button to push that requires no setup. Coolify provides that button!
