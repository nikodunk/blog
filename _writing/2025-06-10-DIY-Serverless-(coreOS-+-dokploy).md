---
layout: post
title: "Flatcar Container Linux + Dokploy make for a great DIY Heroku"
date: 2026-05-24 08:00:00 -0700
---

The hosting landscape ranges from low-cost, high-maintenance to high-cost, low-maintenance solutions. The sequence is roughly as in the image below: full-on VPS => Heroku platform-as-a-service => containers services like Lightsail => serverless functions like on Vercel, Firebase, Cloudflare Workers.

![](/assets/flatcar-dokploy/landscape.jpg)

I'd like to propose a self-hosted PaaS as a great middle-ground. By combining two open source projects (Flatcar, Dokploy) I run 4 projects on a $5 VPS with all of the conveniences of Heroku.

## The Problem

Problem 1: Maintenance - Renting a cheap VPS from someone like Hetzner or Digital Ocean is great. But you need to know a minimum about server maintenance and backups. What about OS updates and security of the underlying OS? What if something goes wrong with an automatic upgrade? How about closing and opening the right ports. Don't have a password login! One of the main benefits of "serverless" like Firebase Functions or "container platforms" like AWS Lightsail or Fargate is that you don't need to babysit an Ubuntu installation with automatic upgrades and OS updates.

Problem 2: Costs slowly add if you add a VPS per project, especially if they're continually running even when not needed. If you have a few projects kicking around that bring in minimal revenue like I do, it's useful to not pay a lot of overhead for a Heroku server each. Container services fall into this category too - 5+ bucks a month per container indefinitely makes you cull periodically. On the serverless function end of the spectrum, your usage can unexpectedly spike from an HN post and you'll get billed for it (Tweets documenting this are wide-spread). You also get walled into whichever walled garden is currently cool (Vercel, Firebase before it, etc).

# A Solution

A locked-down, automatically-updating container host OS like [Flatcar Container Linux](https://www.flatcar.org/) or [Fedora CoreOS](https://fedoraproject.org/coreos) solves most of the server maintenance problems for you. You install it once, close all but the relevant ports in the cloud provider's firewall, and it's pretty much set-and-forget. These installs are only accessible over your SSH key by default. At its best, Flatcar provides a lot of the low-maintenance platform of PaaS, with all of the affordability and vendor neutrality of a VPS. But in comparison to running Ubuntu with unattended upgrades we have atomic rollbacks which are the "killer feature" here. If an update fails, it rolls back to the previous partition. Ubuntu should mostly be fine, but when it isn't it requires manual maintenance. And you'll always be on vacation when the manual maintenance becomes necessary.

So we have an affordable, reliable server with predictable and low costs. We can put multiple projects on it (as we'll do in the next paragraph), adding another project doesn't add more marginal cost overhead until you hit the limits of the VPS, and then scales slowly. Cost is solved.

![](/assets/flatcar-dokploy/flatcar.jpg)

Convenience is not solved yet though: deploying applications with raw Docker still takes focus away from working on your project itself. What about all of the sweet hassle-free features from PaaS like deploy from git, easy database deploys, and - you know - not having to mess around with Kubernetes for your side project? Here's where the second move comes in: [Dokploy](https://dokploy.com). Dokploy is your CI, can put as many projects on your server as you like, builds containers from git, helps you debug logs, is an env manager, and provides UI around container orchestration. It's Heroku, but open-source. You only access Dokploy through https, meaning you can close all SSH and management ports and remove a whole class of (ssh, access) attacks. You back up your relevant databases to an external storage service (best-case S3 on a separate cloud provider), to make things very resilient. Note that for a single-node setup like I run, there will be a brief window of downtime during OS updates unless you configure a reboot strategy.

![](/assets/flatcar-dokploy/dokploy.jpg)

Dokploy itself runs in a container, all your projects and databases do too, and the underlying OS automatically updates (with rollbacks) forever. I think modifying a VPS into a "container service" in this way is the sweet spot of convenience and cost: load that VPS with a bomb-proof no-config OS like coreOS, and put Dokploy on it for a no-fuss container service UI. It gives you the hassle-free experience of a Heroku-like platform, but with the cost and independence of a VPS.

This way you can have your cake and eat it too: most of the benefits of serverless, with most of the benefits of running your own VPS.

![](/assets/flatcar-dokploy/dokploy-2.jpg)

---

Let's implement this Flatcar + Dokploy stack on Hetzner in a quick example.

Go to Hetzner and sign up for an account.

![](/assets/flatcar-dokploy/hetzner.jpg)

Add an SSH key.

Some VPSs like EC2 or Vultr support Flatcar out of the box. To get an image on my preferred Hetzner, you need to upload the Flatcar image to Hetzner yourself. We'll do so with the [officially documented](https://www.flatcar.org/docs/latest/installing/cloud/hetzner/) few lines below:

I downloaded hcloud-upload-image binary, then in the folder with hcloud-upload-image, ran:

```bash
export HCLOUD_TOKEN=<your-token>
export CHANNEL=current
export VERSION=current

./hcloud-upload-image upload \
 --architecture=x86 \
 --compression=bz2 \
 --image-url=https://${CHANNEL}.release.flatcar-linux.net/amd64-usr/${VERSION}/flatcar_production_hetzner_image.bin.bz2 \
 --labels os=flatcar,flatcar-channel=${CHANNEL} \
  --description flatcar-${CHANNEL}-x86
```

<br/>

![](/assets/flatcar-dokploy/hetzner-1.jpg)

Create a server from this image you uploaded, and SSH into it. Note we went slightly off of the recommended path here and didn't add an Ignition file. The main thing an Ignition file does is adds your SSH key to the OS image. But Hetzner adds this into your userdata already, so I found this unnecessary. You can also start your containers with an Ignition file, but that's cumbersome and somewhat non-standard IMO, and that's what we have Dokploy for. So we skipped the Ignition file. Feel free to add one if you need it - either through the Hetzner CLI or paste it into "cloud init" when creating a new image from your snapshot.

![](/assets/flatcar-dokploy/hetzner-2.jpg)

Welcome to your fresh, auto-updating instance of Flatcar!

![](/assets/flatcar-dokploy/hetzner-3.jpg)

```bash
ssh core@<your ip> # we'll lock this down real soon don't worry
```

<br/>

Now let's install Dokploy.

```bash
sudo systemctl enable docker # auto-start Docker on reboot (as we didn't define this in Ignition). From there, Dokploy will do the rest.
sudo -i # one-time, for root
curl -sSL https://dokploy.com/install.sh | sh
```

![](/assets/flatcar-dokploy/hetzner-4.png)

That's it! Go to your server's IP at port 3000 and set up Dokploy, close your ports, and be on your merry way!

You now have an easy to use UI on top of an automatically-updating immutable OS.

![](/assets/flatcar-dokploy/dokploy-2.jpg)

![](/assets/flatcar-dokploy/hetzner-5.png)

Assign the Dokploy UI to a subdomain or domain, and then you can close all the ports except for `80` for http and `443` for https, which will let those pesky bots bite their teeth out when they're sniffing for our non-standard SSH port. Access everything you need through the web dashboard. You shouldn't really need to check in much on the underlying linux system again. You now have an auto-updating and sealed off host, with an auto-updating container deployment system, itself running in a container.

---

Caveat: if your traffic is super intermittent and spikey go for serverless functions. If you’re just starting out go with Heroku.
