---
layout: post
title: "The tiny-team framework: How we optimized our tech stack for code efficiency"
date: 2022-09-23 08:00:00 -0700
tags: ["Essay"]
---

![](/dall_e_efficiency.png)

The [Atmos stack](https://www.joinatmos.com) is optimized around two things: using as few dependencies as possible, and hyper-optimizing around sharing code between different parts of the stack.

We have launched and run a fintech with 10,000+ customers with only 1-2 full-time-equivalent engineers, all while staying secure and fast. With so few engineers to do so much work, we need to be brutally efficient:

## More wood behind fewer arrows

We unified our stack around Javascript over all clients and API for maximum code efficiency - we do not have time to duplicate features over Kotlin, Swift, Svelte and Python for various parts of the stack and clients. We have one API running all code for all projects - we do not have time for microservices. We even have large parts of our frontend logic shared between web and mobile - we don't have time to write things (and more importantly debug things!) twice.

We have optimized various parts in our stack to require as little "overhead" as possible: One goal that a single developer could understand and maintain all project parts (deposits api, deposits jobs, web, android, ios, loans api), and spend their time on actual value-adding work. Therefore all functions for example are written in the exact same super-simple style whether they are on web, mobile or api. Because 1-2 developers is 10-20x less developers than similar competitors are throwing at the engineering, we cannot afford to spend any engineering time on complex systems or we will not have any effort left for feature work. Simpler code also seems to lead to fewer bugs, duh.

Most team members also dogfood the product ie. use the bank every day as their personal bank. Since we have so few codebases, each codebase receives more testing - often 1-2 people using even the most obscure feature. If we had more code bases each line of code would get less testing as our available testers would be more spread out. In addition, due to shared code, testing one platform is basically testing the other. For example: a team member using iOS check deposit will find something is broken for them, before Android users can notice. Or a team member on Edge on Windows will find a permission error for them before any users on mac or on mobile can be affected by it. This is of course all on top of the automated testing we do anyway.

The stack that achieved this and has allowed us to ship a large amount of products - savings, checking, loans, donations clients on web, ios, android - with very few engineers and very few bugs is as follows:

## The stack

All-Javascript Web app, Android & iOS - React & React-Native:

- Monorepo for web & mobile, sharing a /common folder with redux, utility functions, math, permissions, etc etc
- Tailwind as a shared styling language over React & React Native.
- Redux as a shared api requests/state logic library.
- React & React Native updated to the newest versions, matching the newest Expo SDK for React Native.
- Jest running automated integration tests for "critical path" features like application, login, transfer, etc on the CI for both web & mobile on every commit.
- Routing is one thing that is _not_ shared at all in order to feel native: React Navigation on mobile vs. React Router for web.
- Regularly updated and audited dependencies for both React & React Native
- When launching mobile, we quickly merged it into our web codebase/repo to benefit from shared logic, and improvements to mobile improving web.
- Similarly when launching loans, we merged the loans web client into the original client repo almost immediately to piggyback off the devOps of the original product (deposits). Further, the deposits product then benefitted from the component improvements made while engineering a brand new product. Massive design and performance improvements resulted from this, including the removal of Material-UI which we'd originally launched on and moving with Tailwind also on the deposit product.

All-Javascript API - Node, Hapi & Bull Queue running on Heroku:

- A single api running all code for deposits, loans, job runners, etc
- Regularly updated & audited packages including Node versions to unlock newest features & ensure security
- Integration test coverage of critical path user flows (apply, login, transact), enforced by CI.
- A single API and jobs queue for all features: deposits, loans, monthly jobs, loans, etc
- When launching loans, we merged the api into the original api repo almost immediately to piggyback off the devOps of the original product (bank), and also so we could benefit from improvements made for loans: Bank received non-blocking account opening and tons of dead code removal.

Other:

- Webflow CMS for static landing pages
- Retool dashboard to access api jobs, and to detect fraud, approve users, approve loans, see growth, etc.
- If a task that needs to be done once we hand-perform it, the second time we write an api job for it, and if it happens a 3rd time we write an interface for that api job, so that engineering never needs to be pulled into (read: block) the loop again.

## Benefits so far from unified stack

- Copy paste code from the web, mobile, server
- Use the same libraries on the web, mobile, server
- Use similar testing syntax over api, iOS, Android, Web app
- Less onboarding for engineers
- Libraries: Library updates on one project benefit the all others (ie. Node), downside: library updates block the other. Way fewer dependencies to understand, audit, and use. Downside: we are deeply invested in a single library for a task.
- More dogfooding: Dogfooding mobile dogfoods web too - if one team member dogfoods web and another team member dogfoods mobile, we'll have pretty good coverage - especially since most of the code is shared.
- By [choosing boring, well-tested technology](https://boringtechnology.club/), for example avoiding microservices or non-relational databases, we benefitted from all the upsides mentioned in the talk: devops improvements to one part of our company benefited another, unifying around React lead to us improving already-built products while building out new products, etc etc.

## Other possible approaches

In a perfect world we'd have a single codebase that renders everything server-side in a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern requirements of native apps on 2 platforms, native web experience for specific use cases - we needed to balance efficiency with customer expectations/competitiveness.

- Flutter, Flutter on web, Rails - still requires 2 languages each with their idiosyncracies, and Flutter on web is half-baked at best. Plus, at this point post-Angular I don't trust Google's commitment to any project long-term
- Django, Rails or Express for api & web, Swift for iOS, Kotlin for Android - brings 3 languages into the mix for 3x the amount of code writing and debugging, in return for minimal performance benefits and a slightly more native feel.
- Electron for web, native & mobile, node for the backend - definitely an option, though feels significantly less native IMO than react-native on mobile, which is 50+ percent of our user base's preferred platform (based on analytics).
- Basecamp-style: rendering api & web on Rails, with the mobile app's navigation rendered natively, but the actual screens rendered on the server - this seems crazy, but seems to be working for Hey.com. If another bigger company jumps to this, we could get on board with this. But we don't have time to risk a new approach like this at our scale :)
- Microservices, Kubernetes, Terraform, ... overkill for our current scale.

## Conclusion

In summary, our Atmos stack will not be perfect for every software project, but it is strongly recommended for tiny startups as it has allowed us to deliver way more value to customers per engineering hour than any other solution currently available.
