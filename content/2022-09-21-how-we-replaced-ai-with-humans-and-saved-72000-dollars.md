---
layout: post
title: "How to replace AI with humans"
date: 2022-09-21 08:00:00 -0700
categories:
---

While most companies are busy at work trying to replace humans with some form of automation or AI, this is the story of how [Atmos](https://www.joinatmos.com) replaced an AI fraud prediction solution with simple dashboard to make human decision making as efficient as possible.

We too began with what most fintech startups do: we subscribed to a fraud-prevention vendor - after all if it's the vendor's bread-and-butter to prevent fraud, they'll probably be better at it than we are, right? We quickly were hit by a few unpredicted "exceptions" that the vendor had missed that cost us dearly. One is too many. So, while our competitors continued in this direction, we decided instead of going all-in on 3rd party anti-fraud AI vendors to add an additional layer of security on top of this before the final decision. We built a dashboard to make human decisioning as efficient as possible, after the AI had made its prediction.

This method was inspired by an article by the Bearblog founder Herman's article ["From 5 hours to 15 minutes per week"](https://herman.bearblog.dev/5-hours-to-15-minutes/).

It has saved us more than $100,000 in prevented fraud and additional wasted effort cleaning up said fraud, depending on estimation methods, but more importantly kept us safe. We have had a near-zero fraud cost since then. Other fintechs in our space have struggled with non-zero fraud costs, proven by the fact that a some have had to throttle or close new applications due to fraud, while we have not.

Instead of building a 99% precise self-driving car, we have found success in a building a 100% precise, very efficient bicycle. It won't scale to 1B users, but it doesn't have to - it kept us safe until we had more bandwidth to address the issue more scalably.
