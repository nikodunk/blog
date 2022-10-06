---
layout: post
title: "How to replace an AI with humans"
date: 2022-09-21 08:00:00 -0700
categories:
image: /replacing-ai-with-human-dalle.png
---

<img src="/replacing-ai-with-human-dalle.png" style="max-width: 200px; text-align: center"/>

Many companies are trying to replace humans with automation or AI. This is the story of how [Atmos](https://www.joinatmos.com) did the opposite. We replaced a fraud prediction artificial intelligence with a dashboard to help human intelligence be as efficient as possible.

It has saved us roughly $100,000 so far in prevented fraud and clean-up effort (depending on estimation methods). More importantly it has kept our users safe, and us safe and compliant. We have had a near-zero fraud on our platform since the introduction of this system. Other fintech startups in our space have struggled with high fraud rates, proven by the fact that a some have had to throttle new applications while we have not.

We initially signed up with an anti-fraud AI vendor like most fintechs do. We assumed a specialized vendor would be better at it than we are, but a few un-predicted fraud cases quickly cost us dearly. When the company is still small, one is too many. So we decided to add an additional layer of human security before the final decision instead of handing off all control to an AI.

We built a simple dashboard to present a human with all the information they need to make a 100% precise decision. And to make it ridiculously easy to either approve or request more info from all unclear cases. In short, to make human decision and follow-up as close to machine-speed as possible.

This method was inspired by an article by the Bearblog founder Herman's article ["From 5 hours to 15 minutes per week"](https://herman.bearblog.dev/5-hours-to-15-minutes/).

We have tried hard to augment human intuition instead of trusting artificial intelligence, and thereby traded speed (fast human vs. instant machine) with precision (100% trustworthy human prediction vs. 99.5% trustworthy machine). Instead of building a 99% precise self-driving car, we have found success in a building a 100% precise, very efficient bicycle. Our method won't scale to 1B users, but it doesn't have to - it kept us safe until we had more bandwidth to address the issue more scalably.
