---
layout: post
title: "How to replace an AI with humans"
date: 2022-09-21 08:00:00 -0700
categories:
---

<img src="/replacing-ai-with-human-dalle.png" style="max-width: 200px; text-align: center"/>

While most companies are busy at work trying to replace humans with some form of automation or AI, this is the story of how [Atmos](https://www.joinatmos.com) replaced an AI fraud prediction solution with a simple dashboard to make human decision making as efficient as possible.

We too began with what most fintech startups do: we signed a contract with a vendor of fraud-prevention software - after all if it's the vendor's bread-and-butter to prevent fraud, they'll probably be better at it than we are, right? We quickly were hit by a few unpredicted "exceptions" that cost us dearly. One is too many when the company is still small. So we decided instead of going all-in on 3rd party anti-fraud AI vendors: to add an additional layer of security on top of the AI before the final decision. We built a dashboard to present a human with all the information they need to make a 100% precise decision, and to make it ridiculously easy to either approve or request more info from all cases where we are not 100.00% sure of the legitimacy of the case. In short, to make human decisioning and follow-up as close to machine-speed as possible.

This method was inspired by an article by the Bearblog founder Herman's article ["From 5 hours to 15 minutes per week"](https://herman.bearblog.dev/5-hours-to-15-minutes/).

It has saved us roughly $100,000+ so far in prevented fraud and clean-up effort, depending on estimation methods, but more importantly kept our users safe, us safe, and compliant. We have had a near-zero fraud on our platform since the introduction of this system. Other fintechs in our space have struggled with high fraud rates, proven by the fact that a some have had to throttle new applications while we have not.

We have tried hard to augement human intelligence instead of trusting artificial intelligence, and thereby traded speed (fast human vs. instant machine) with precision (100% trustworthy human prediction vs. 99.5% trustworthy machine). Instead of building a 99% precise self-driving car, we have found success in a building a 100% precise, very efficient bicycle. Our method won't scale to 1B users, but it doesn't have to - it kept us safe until we had more bandwidth to address the issue more scalably.
