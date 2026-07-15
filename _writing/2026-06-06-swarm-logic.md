---
layout: post
title: "Swarm logic for batteries"
date: 2026-07-06 08:00:00 -0700
categories:
---

![](/assets/swarms/pelicans-on-ocean-beach-2.jpg)

[Swarm logic (or swarm intelligence)](https://en.wikipedia.org/wiki/Swarm_intelligence) in software is a design approach where complex, intelligent behavior emerges from many simple agents following simple local rules — with no central controller coordinating them.

Each agent only knows about its immediate environment and neighbors, yet the collective produces sophisticated global behavior. The “intelligence” lives in the system, not any individual.

A problem we had with initial versions of [Pila Energy](https://pilaenergy.com) was that our leader/coordinator would be reset or knocked offline, leading to the followers becoming "dumb" batteries again. This is obviously not acceptable for a resiliency product. We also don't want to move the controller to the cloud, because we believe that your hardware should belong to you, no matter whether our cloud is accessible or not.

One day when surfing at Ocean Beach, a V-formation of pelicans flew overhead. From my low vantage point over the water, I saw how one pelican peeled off and the others seamlessly closed the gap in the V. I was reminded of how resilient and simple swarm logic can be. Each bird follows 3 simple rules: stay close, avoid collision, match direction. This leads to the V, and makes the system very resilient.

This "leaderless" logic became known as the "pelican logic", and the swarm of equals is now implemented for Pila's mesh aggregation and decisioning. This makes our whole-home battery system act as a whole whether you've decided to pair with our cloud or not, and dynamically adapts even if certain batteries get moved or become unavailable.

---

Note: LA times [covered](https://www.latimes.com/california/story/2021-04-29/uc-san-diego-pelicans) how pelicans glide above the ocean, but I stole this photo from [Ian Wood](https://www.agoodplace.co.uk/pelicans-nicaragua).
