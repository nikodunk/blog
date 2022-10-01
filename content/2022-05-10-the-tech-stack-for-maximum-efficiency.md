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

We have optimized various parts in our stack to require as little "maintenance overhead" as possible: One goal that a single developer could understand and maintain all project parts (deposits api, deposits jobs, web, android, ios, loans api), and spend their time on actual value-adding work. Because 1-2 developers is 10-20x less developers than similar competitors are throwing at the engineering, we cannot afford to spend any engineering time on complex systems or we will not have any effort left for feature work.

- Therefore all functions for example are written in the exact same super-simple style whether they are on web, mobile or api. We use as few abstractions as possible, and use the same simple query syntax right throughout the server, apps, etc. Simpler, less abstracted code also seems to lead to fewer bugs, duh.
- We use as few libraries as possible, and when we do we use a simple, well-tested one that will work on server, mobile and web.
- When we need similar logic on web, mobile and API - as often happens, it goes in a shared atmos library where all parts of the stack can access it. This way a single change or bugfix to a permission error fixes it everywhere in the stack and things stay in sync.

Most team members also dogfood the product ie. use the bank every day as their personal bank. Since we have so few codebases, each codebase receives more testing - often 1-2 people using even the most obscure feature. If we had more code bases each line of code would get less testing as our available testers would be more spread out. In addition, since most of the code is shared dogfooding mobile essentially tests web logic too - if one team member dogfoods web and another team member dogfoods each mobile platform. For example: a team member using iOS check deposit will find something is broken for them before Android users can notice. Or a team member on Edge on Windows will find a permission error for them before any users on mac or on mobile can be affected by it. This is of course all on top of the automated testing we do anyway.

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
- Retool dashboard to access api jobs, and to detect fraud, approve users, approve loans, see growth, etc.

## Benefits we've seen

- Move code between web, mobile, server as necessary
- Use the same libraries on the web, mobile, server
- Use similar testing syntax over api, iOS, Android, Web app
- Less onboarding for engineers
- Library updates on one project benefit the all others (ie. Node), downside: library updates block the other. Way fewer dependencies to understand, audit, and use. Downside: we are deeply invested in a single library for a task.
- By [choosing boring, well-tested technology](https://boringtechnology.club/), for example avoiding microservices or non-relational databases, we benefitted from all the upsides mentioned in the talk: devops improvements to one part of our company benefited another, unifying around React lead to us improving already-built products while building out new products, etc etc.
- When launching mobile apps around 6 months after launching web, we quickly merged it into our web codebase/repo to benefit from shared logic, and improvements made to mobile components improved the web app.
- When launching loans, we merged the loans web client into the original client repo almost immediately to piggyback off the devOps of the original product (deposits). The deposits web product then benefitted from the component improvements made while engineering the brand new loans product: Massive design and performance improvements resulted from this, including the removal of Material-UI which we'd originally launched with and moving to a consistent Tailwind also on web and mobile. The merged api benefitted from improvements made for loans too: The original product hained non-blocking account opening and tons of dead code removal.
- If a task that needs to be done once we hand-perform it, the second time we write an api job for it, and if it happens a 3rd time we write an interface for that api job, so that engineering never needs to be pulled into (read: block) the loop again.

## Other approaches

In a perfect world we'd have a single codebase that renders everything server-side in a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern requirements of native apps on 2 platforms, native web experience for specific use cases - we needed to balance efficiency with customer expectations/competitiveness.

- Flutter, Flutter on web, Rails - still requires 2 languages each with their idiosyncracies, and Flutter on web is half-baked at best. Plus, at this point post-Angular I don't trust Google's commitment to any project long-term
- Django, Rails or Express for api & web, Swift for iOS, Kotlin for Android - brings 3 languages into the mix for 3x the amount of code writing and debugging, in return for minimal performance benefits and a slightly more native feel.
- Electron for web, native & mobile, node for the backend - definitely an option, though feels significantly less native IMO than react-native on mobile, which is 50+ percent of our user base's preferred platform (based on analytics).
- Basecamp-style: rendering api & web on Rails, with the mobile app's navigation rendered natively, but the actual screens rendered on the server - this seems crazy, but seems to be working for Hey.com. If another bigger company jumps to this, we could get on board with this. But we don't have time to risk a new approach like this at our scale :)

## Conclusion

In summary, our Atmos stack will not be perfect for every software project, but it is strongly recommended for tiny startups as it has allowed us to deliver way more value to customers per engineering hour than any other solution currently available.
