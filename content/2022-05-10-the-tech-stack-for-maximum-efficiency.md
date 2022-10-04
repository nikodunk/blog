---
layout: post
title: "The tiny-team framework: Less code, more speed."
date: 2022-09-23 08:00:00 -0700
tags: ["Essay"]
---

![](/dall_e_efficiency.png)

The [Atmos stack](https://www.joinatmos.com) has launched and run a fintech with 10,000+ customers with only 1-2 full-time-equivalent engineers, all while staying secure and [rapidly iterating](http://paulgraham.com/avg.html). With so few engineers to do so much work, we need to be brutally efficient: simple code style, using as few dependencies as possible, and hyper-optimizing around sharing code between different parts of the stack.

## More wood behind fewer arrows

We unified our stack around Javascript over all clients and API for maximum code efficiency - we do not have time to duplicate features over Kotlin, Swift, Svelte and Python for various parts of the stack and clients. We have one API running all code for all projects - we do not have time for microservices. We even have large parts of our frontend logic shared between web and mobile - we don't have time to write things (and more importantly debug things!) twice.

We have optimized various parts in our stack to require as little "maintenance overhead" as possible: One goal that a single developer could maintain all project parts (deposits api, deposits jobs, web, android, ios, loans api), and spend their time on actual value-adding work. Because 1-2 developers is 10-20x less developers than similar competitors are throwing at the engineering, we cannot afford to spend any engineering time on complex systems or we will not have any effort left for feature work. A side effect of this is that there's also less mental overhead understanding all code parts, which means less onboarding for engineers and fewer bugs.

Therefore all functions for example are written in the exact same super-simple style whether they are on web, mobile or api. We use as few abstractions as possible, and use the same simple query syntax right throughout the server, apps, etc. Simpler, less abstracted code also seems to lead to fewer bugs, duh.

We use as few libraries as possible, and when we do we use a simple, well-tested one that will work on server, mobile and web. Using the same libraries everywhere, and library updates on one part of the stack benefit the all others (ie. Node). There are also way fewer dependencies to understand, audit, and learn how to use. The downside is that library updates block the other, and we are deeply invested in a single library for a task.

When we need similar logic on web, mobile and API - as often happens, it goes in a shared atmos library where all parts of the stack can access it. This way a single change or bugfix to a permission error fixes it everywhere in the stack and things stay in sync. We can also move code, tests between web, mobile, server as necessary.

Since we have so few codebases, each codebase and line of code receives more testing - as our available testers are not spread out as much. Most team members dogfood the product ie. use the bank every day as their personal bank - often 1-2 people using even the most obscure feature. In addition, since most of the code is shared dogfooding mobile essentially tests web logic too - if one team member dogfoods web and another team member dogfoods each mobile platform. For example: a team member using iOS check deposit will find something is broken for them before Android users can notice. Or a team member on Edge on Windows will find a permission error for them before any users on mac or on mobile can be affected by it. This is of course all on top of the automated testing we do anyway.

We have seen much cross-polination by merging code bases: When launching mobile apps around 6 months after launching web, we quickly merged it into our web codebase/repo to benefit from shared logic, and improvements made to mobile components improved the web app. When launching loans, we merged the loans web client into the original client repo almost immediately to piggyback off the devOps of the original product (deposits). The deposits web product then benefitted from the component improvements made while engineering the brand new loans product: Massive design and performance improvements resulted from this, including the removal of Material-UI which we'd originally launched with and moving to a consistent Tailwind also on web and mobile. The merged api benefitted from improvements made for loans too: The api gained non-blocking account opening and tons of dead code removal. Generally, DevOps improvements to one part of our company benefited another, unifying around React lead to us improving already-built products while building out new products, as mentioned in the great [Boring Technology](https://boringtechnology.club/) talk.

A breakdown of the system that has allowed us to ship a large amount of products - savings, checking, loans, donations clients on web, ios, android - with very few engineers and very few bugs is as follows:

## The stack pt 1: All-Javascript iOS, Android & Web apps

- React for web & React Native/Expo for mobile. Updated to the newest versions, matching the newest Expo SDK for React Native. Regularly updated and audited dependencies.
- Monorepo the two client projects, sharing a /common folder of shared logic, utility functions, math, permissions, etc etc
- Tailwind as a shared styling language over React & React Native (thanks to twrnc)
- Redux as a shared api requests/state logic library.
- Routing is one thing that is _not_ shared at all in order to feel native: React Navigation on mobile vs. React Router for web.
- Jest running automated integration tests for "critical path" features like application, login, transfer, etc on the CI for both web & mobile on every commit.

## The stack pt 2: All-Javascript API

- Heroku, so as to use as little time as possible on DevOps
- Node/Hapi, a single api running all code for deposits, loans etc
- BullMQ & Redis: A single jobs queue for all features: deposits, loans, monthly jobs, etc
- Postgres database, not time for non-relational systems here
- Regularly updated & audited packages including Node versions to unlock newest features & ensure security
- Integration test coverage of critical path user flows (apply, login, transact), enforced by CI.

## Other: Landing Pages & Internal dashboards

- Webflow CMS for static landing pages
- Retool dashboard to access api jobs, and to detect fraud, approve users, approve loans, see growth, etc. If a task needs to be done we hand-perform it, the second time we write an api job for it, and if needs to be done a 3rd time we write an interface for that api job, so that engineering never needs to be pulled into (read: block) the loop again.

## Other approaches

In a perfect world we'd have a single codebase that renders everything server-side in a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern customer expectations of native apps on iOS, Android & web - we needed to balance efficiency with competitiveness.

- Flutter, Flutter on web, Dart api - Notes: 1 language, Dart on backend is less established, Flutter on web is unfinished, Google's commitment to any project?
- Swift iOS, Kotlin Android, Django/Rails for Web & api - Notes: 3 languages, but all completely native. Lose most benefits from this article.
- React for web, Cordova React iOS & Android, Express api - Notes: 1 language, less native feel on mobile which is primary platform for 50% of users
- Rails for web, iOS, Android & api (Hey.com Style), with the mobile app's navigation rendered natively. Notes: 1 language, New approach, Maybe once battle-tested?, We try to pick boring technology as described above :)

## Conclusion

In summary, our Atmos stack will not be perfect for every software project, but it is strongly recommended for tiny startups as it has allowed us to deliver way more value to customers per engineering hour than any other solution currently available.
