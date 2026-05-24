---
layout: post
title: "Flatcar + Dokploy - a great match for DIY Heroku"
date: 2026-05-24 08:00:00 -0700
---

The hosting landscape is a gradient between low-cost, high-maintenance and high-cost, low-maintenance. The sequence is roughly: full-on VPS => Heroku platform-as-a-service => containers alone like Lightsail => serverless functions like on Vercel, Firebase, Cloudflare Workers.

![](/assets/flatcar-dokploy/landscape.jpg)

## Problems

Problem 1: Costs slowly add up, or can spike - Especially if you have a few projects kicking around that bring in minimal revenue like I do, it's useful to not pay a lot of overhead for a Heroku server each. Container services fall into this category too - 5+ bucks a month per container indefinitely makes you cull periodically. On the other hand, if usage does spike, then serverless can become a cost-issue (Tweets documenting this are wide-spread), and you get walled into whichever walled garden is currently cool (Vercel, Firebase before it, etc).

Problem 2: Maintenance - Renting a cheap VPS from someone like Hetzner or Digital Ocean is great. But you need to know a minimum about server maintenance and backups. What about OS updates and security of the underlying OS? What if something goes wrong with an automatic upgrade? How about closing and opening the right ports. Don't have a password login! One of the main benefits of "serverless" like Firebase Functions or "container platforms" like AWS Lightsail or Fargate is that you don't need to babysit an Ubuntu installation with automatic upgrades and OS updates.

# Solutions

A limited, locked-down container-first OSs like [Flatcar Container Linux](https://www.flatcar.org/) or [Fedora CoreOS](https://fedoraproject.org/coreos) solve most of the maintenance problems for you. You install them once, open/close the relevant ports in the Hetzner dash, and you're pretty much set-and-forget. They are only accessible over your SSH key by default. At its best, CoreOS provides a lot of the low-maintenance platform of PaaS, with all of the affordability and vendor neutrality of a VPS. We have an affordable server which can't spike. If we can put multiple projects on it as we'll do in the next paragraph so adding another project doesn't add more marginal cost overhead, cost is solved.

![](/assets/flatcar-dokploy/flatcar.jpg)

Maintenance is only partially solved though: Our server itself is a stable, secure, maintenance-free platform, but we still need to maintain and do devops on it. What about all of the sweet maintenance-free devops features from PaaS like deploy from git, easy database deploys, and - you know - not having to mess around with Kubernetes for your side project? Here's where the second move comes in: [Dokploy](https://dokploy.com). Dokploy is your CI, can put as many projects on your server as you like, builds containers from git, helps you debug logs, is an env manager, and provides UI around container orchestration. It's Heroku, but open-source. You only access Dokploy through https, meaning you can close all ports and remove a whole class of (ssh, access) attacks. You back up your relevant databases to an external storage service (best-case S3 on a separate cloud provider), to make things truly bullet-proof.

![](/assets/flatcar-dokploy/dokploy.jpg)

Dokploy itself runs in a container, and the underlying OS automatically updates (with rollbacks) forever. I think modifying a VPS into a "container service" in this way is the sweet spot of convenience and cost: load that VPS with a bomb-proof no-config OS like coreOS, and put Dokploy on it for a no-fuss container service UI. It gives you the hassle-free experience of a Heroku-like platform, but with the cost and independence of a VPS.

This way you can have your cake and eat it too: most of the benefits of serverless, with most of the benefits of running your own VPS.

![](/assets/flatcar-dokploy/dokploy-2.jpg)

---

Caveats: if your traffic is super intermittent and spikey go for serverless functions. If you’re just starting out go with Heroku.

---

Let's implement this Flatcar + Dokploy stack on Hetzner in a quick example.

Go to Hetzner and sign up for an account.

![](/assets/flatcar-dokploy/hetzner.jpg)

Add an SSH key.

Some VPSs like EC2 or Vultr support Flatcar out of the box. To get an image on my preferred Hetzner, you need to upload the Flatcar image to Hetzner yourself. This is [officially documented on Flatcar's docs](https://www.flatcar.org/docs/latest/installing/cloud/hetzner/), and is a few lines.

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

---

![](/assets/flatcar-dokploy/hetzner-1.jpg)

Create an image from the server, and SSH into it. Note we went slightly off of the recommended path here and didn't add an ignition file. The main thing an ignition file does is adds your SSH key to the OS image. But Hetzner adds this into your userdata already, so I found this unnecessary. You can also start your containers with an ignition file, but that's cumbersome and somewhat non-standard IMO, and that's what we have Dokploy for. So we skipped the Ignition file. Feel free to add one if you need it - either through the Hetzner CLI or paste it into "cloud init" when creating a new image from your snapshot.

![](/assets/flatcar-dokploy/hetzner-2.jpg)

Welcome to your fresh, auto-updating instance of Flatcar!

![](/assets/flatcar-dokploy/hetzner-3.jpg)

```bash
ssh core@<your ip> # we'll lock this down real soon don't worry
```

Let's install Dokploy!

```bash
sudo -i # one-time, for root
curl -sSL https://dokploy.com/install.sh | sh
```

![](/assets/flatcar-dokploy/hetzner-4.png)

That's it! Go to your server's IP at port 3000 and set up Dokploy, close your ports, and be on your merry way!

You now have an easy to use UI on top of an automatically-updating immutable OS.

![](/assets/flatcar-dokploy/dokploy-2.jpg)

![](/assets/flatcar-dokploy/hetzner-5.png)

Close all the ports except for 80 and 443 for http and https, which makes you immune to even SSH sniffing, and access everything you need through the web dashboard. You shouldn't really need to check in much on the underlying linux system again.
