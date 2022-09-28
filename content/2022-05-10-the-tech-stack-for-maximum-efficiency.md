---
layout: post
title: "The tiny-team framework: How Atmos optimized its tech stack around code efficiency"
date: 2022-05-10 08:00:00 -0700
tags: ["Essay"]
---

## More wood behind fewer arrows

The [Atmos](https://www.joinatmos.com) stack is not special, but it's different in its approach from other software projects: it uses as few dependencies as possible, shares code between parts of the stack, and optimizes for engineering efficiency.

We have launched and run a fintech with 10,000+ customers with only 1-2 full-time-equivalent engineers, all while staying secure and fast. With so few engineers to do so much work, we need to be brutally efficient:

We unified our stack around Javascript over all clients and API for maximum efficiency - we do not have time to duplicate features over Kotlin, Swift, Svelte and Python for various parts of the stack and clients. We have one API running all code for all projects - we do not have time for microservices. We even have large parts of our frontend logic shared between web and mobile - we don't have time to write things (and more importantly debug things!) twice.

We have optimized various other things in our stack to require as little maintenance as necessary. Our engineering goal was always that as few developers as possible could maintain all the various project parts (deposits api, deposits jobs, web, android, ios, loans api), and spend their time on actual value-adding work. Because a 1-2 developers is 10-20x less developers than similar competitors are throwing at the engineering, so we cannot afford to spend any engineering time on duplicated effort or we will not have any effort left at all for feature work. Our baseline for "overhead engineering" is designed to be so low that if push comes to shove we can survive with very few engineers (but if we have more - great!).

This reduction of engineering overhead had the side effect of leading to faster, more bug-free feature delivery and more time spent dogfooding (using your own product) & polishing user experiences: We did not have multiple client codebases & apis that require more people to maintain them, but we also have way less code surface to test & debug as most of it is shared: a team member of our small team using each banking feature (ie. check deposit) and banking client (ie Android, iOS, web on Windows, etc) regularly is enough to give us pretty good real-world test coverage and make sure nothing breaks without our automated testing noticing. We are lucky enough to have an Android user, an iOS user, a few mac users, a Windows user, and get pretty good real-world signals if something does break.

The stack that achieved this and has allowed us to ship a large amount of products - savings, checking, loans, donations clients on web, ios, android - with very few engineers and very few bugs is as follows:

## The stack

Javascript Web & Mobile - React & React-Native:

- Clients monorepo sharing a /common folder with redux, utility functions, math, permissions, etc etc
- Tailwind as a shared styling language over React & React Native.
- Redux as a shared api requests/state logic library.
- React & React Native updated to the newest versions, matching the newest Expo SDK for React Native.
- Jest running automated integration tests for the biggest features on the CI for both client projects on every commit.
- Routing is not shared in order to feel native: React Navigation on mobile vs. React Router for web.
- As much testing as possible in day-to-day banking from team members, on web (windows, mac, etc), iOS and Android.
- Regularly updated and audited dependencies for both subprojects, done regularly.

Javascript API - Node (Hapi & Bull Queue) running on Heroku:

- Regularly updated & audited packages & Node versions to unlock newest features & ensure security
- Integration test coverage of critical path user flows (apply, login, transact), enforced by CI.
- A single API and jobs queue for all features: deposits, loans, monthly jobs, loans, etc

Other:

- Webflow for landing pages
- Retool as to access to numberous admin api functions to detect fraud, approve users, approve loans, see growth, etc. There's a goal to hand-perform a task that needs to be done once, if it happens a second time we write an api job for it, and if it happens a 3rd time we write an interface for that api job, so that engineering never needs to be pulled into (read: block) the loop again.

## Benefits so far from this unified stack

- Copy paste code from the web, mobile, server
- Use the same libraries on the web, mobile, server
- Use similar testing syntax
- Less onboarding for engineers
- Library updates on one benefit the other (ie. Node), downside: library updates block the other.
- More dogfooding: Dogfooding mobile dogfoods web too - if one team member dogfoods web and another team member dogfoods mobile, we'll have pretty good coverage - especially since most of the code is shared.
- By [choosing boring, well-tested technology](https://boringtechnology.club/), and avoiding say serverless or non-relational databases, we benefitted from all the upsides metnioned in the talk: devops improvements to one part of our company benefited another, unifying around React lead to us improving already-built products while building out new products, etc etc.
- Way fewer dependencies to understand, audit, and use. Downside: we have quite a few eggs in Bull's basket.
- When launching mobile, we quickly merged it into our web codebase/repo to benefit from shared logic, and improvements to mobile improving web.
- Adding our follow-on loans product, we merged the web client into the main web repo almost immediately to piggyback off the devOps of the main product (bank), and also so that the bank could benefit from the component improvements made while engineering a brand new product. Massive design and performance improvements resulted from this, including the removal of Material-UI which we'd originally launched on and going with Tailwind.
- Adding our follow-on loans product, we merged the api into the main api repo almost immediately to piggyback off the devOps of the main product (bank), and also so we could benefit from improvements made for loans: Bank received non-blocking account opening and tons of dead code removal.

## Other approaches towards the same goal

In a perfect world we'd have a single codebase that renders everything server-side in a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern requirements of native apps on 2 platforms, native web experience for specific use cases - we needed to balance efficiency with customer expectations/competitiveness.

- Flutter, Flutter on web, Rails - still requires 2 languages each with their idiosyncracies, and Flutter on web is half-baked at best. Plus, at this point post-Angular I don't trust Google's commitment to any project long-term
- Django, Rails or Express for api & web, Swift for iOS, Kotlin for Android - brings 3 languages into the mix for 3x the amount of code writing and debugging, in return for minimal performance benefits and a slightly more native feel.
- Electron for web, native & mobile, node for the backend - definitely an option, though feels significantly less native IMO than react-native on mobile, which is 50+ percent of our user base's preferred platform (based on analytics).
- Basecamp-style: rendering api & web on Rails, with the mobile app's navigation rendered natively, but the actual screens rendered on the server - this seems crazy, but seems to be working for Hey.com. If another bigger company jumps to this, we could get on board with this. But we don't have time to risk a new approach like this at our scale :)
- Microservices, Kubernetes, Terraform, ... overkill for our current scale.

## Conclusion

In summary, our all-JS stack may not be the sexiest or most pure, but it is by far the most efficient in the current requirements, and allows us to deliver way more value per engineering hour to customers than other solutions currently available.
