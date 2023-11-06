---
layout: post
title: "How a lean tech stack helps our tiny team move fast"
date: 2022-09-23 08:00:00 -0700
tags: ["Essay"]
image: /assets/efficiency_dalle.png
---

Originally posted at [https://www.joinatmos.com/blog/how-a-unified-tech-stack-helps-our-tiny-team](https://www.joinatmos.com/blog/how-a-unified-tech-stack-helps-our-tiny-team)

The following system has helped [Atmos](https://www.joinatmos.com) support 10,000+ customers on 3 platforms with only 1-2 full-time-equivalent engineers. Thanks to this stack we've stayed secure and [iterated rapidly](http://paulgraham.com/avg.html). We need to be 10-20x more efficient than our nearest competitors (update: one of them closed) as our engineering team is 10-20x leaner than theirs.

We mainly stay efficent by reducing mental overhead and reducing maintenance burden. Our products are numerous - web, ios, android, savings, checking, loans, deposits, jobs - and yet a single developer should be able to understand, maintain and improve all of them.

## More wood behind fewer arrows

We use one language (Javascript) everywhere for maximum efficiency and deeper understanding - we do not have time to write (and debug!) features multiple times in Kotlin on Android, Swift on iOS, Svelte on web and Python on the server. We can move code between web, mobile & server as necessary.

We keep our code style as simple and abstraction-free as possible. This helps with reasoning, and seems to prevent bugs.

We use as few technologies as possible, so we can understand them deeply and invest in them. Simple, [boring](https://boringtechnology.club/) ones (like PSQL) are good. We share them on server, mobile and web (like Moment). Library updates on one part of the stack benefit us everywhere, like a Queue or database optimization for example. We have one server running all projects - we do not have time for microservices.

We share code between products wherever possible. Similar logic on web, mobile and server goes in a shared Atmos library where all parts of the stack can access it. This way a single bug fix to a permission error fixes it everywhere.

Shared code also helps us improve existing products while building new ones. Improved mobile components cross-pollinate into our web code, and improved loans UX boosts the original deposit UX. All products benefit from performance improvements made anywhere, for example when non-blocking account opening was built for loans it worked great on deposits.

Testers are spread less thin when you have more shared code. As most of the business logic is shared, using an obscure feature on web provides basic mobile testing. A team member confirming a wire address on iOS will find a bug before Android or web users notice.

Bugs are mostly discovered in internal testing because we use our products personally. This is on top of automated testing we do.

A breakdown of the stack is below.

![](/assets/efficiency/stack2.png)

## The stack pt 1: All-Javascript iOS, Android & Web apps

- React on web
- React Native/Expo for iOS and Android
- Git client monorepo with a /common folder of shared business logic, utilities, permissions, etc
- Tailwind as a shared styling language over React & React Native (thanks to twrnc)
- Redux as a shared api request/state logic library
- Routing is _not_ shared in order to feel native: React Navigation for mobile vs. React Router for web
- Jest integration tests for "critical path" features like apply, login, transfer, etc

![](/assets/efficiency/api.png)

## The stack pt 2: All-Javascript API

- Hapi/Node, a single server running all code for checking, savings, loans, donations, webhooks, etc
- Heroku, as little time as possible on DevOps
- BullMQ & Redis: A single jobs queue for all features: apply, checking, savings, loans, jobs, etc
- PSQL database, no time for non-relational systems here
- Updated & audited packages and Node versions to unlock newest features & ensure security
- Integration test coverage of critical-path routes (apply, login, transact), enforced by CI.

![](/assets/efficiency/landing_page.png)

## Landing Page, dashboards & process

- [Webflow](https://webflow.com) CMS for static landing pages
- [Retool](https://retool.com) dashboard to access server jobs, and to detect fraud, approve users, approve loans, see growth, etc.
- If a task needs to be done we hand-perform it, the second time we write a server job for it, and if needs to be done a 3rd time we write an interface for that server job, so that engineering never needs to be pulled into (read: block) the loop again.
- [Sendgrid](https://sendgrid.com) for both transactional emails and marketing emails. We don't have time to synchronize contact lists and content between Sendgrid and Mailchimp and Sendgrid single-sends are good enough.

## Alternatives

In a perfect world we'd have a single codebase that renders everything server-side in a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern customer expectations of native apps on iOS, Android & web - we needed to balance efficiency with competitiveness.

- Flutter, Flutter on web, Dart server - Notes: 1 language, Dart on backend is less established, Flutter on web is unfinished.
- React for web, Ionic React iOS & Android, Express server - Notes: 1 language, less native feel on mobile which is primary platform for 50% of users
- Rails for web, iOS, Android & server (Hey.com Style), with the mobile app's navigation rendered natively. Notes: 1 language, New approach, Maybe once battle-tested?, We try to pick boring technology as described above :)

## Conclusion

In summary, the Atmos stack will not be perfect for every software project but it is strongly recommended for tiny startups. It has allowed us to deliver way more value to customers per engineering hour than any other solution currently available.
