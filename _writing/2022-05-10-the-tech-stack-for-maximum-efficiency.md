---
layout: post
title: "How a unified tech stack helps our lean team move fast"
date: 2023-11-07 08:00:00 -0700
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

## The stack pt 1: All-Javascript iOS, Android & Web apps

![](/assets/efficiency/stack2.jpg)

- React/Remix SPA on web. We use Remix SPA on top of React for bundle splitting, standardized routing conventions, and great error catching.
- React Native/Expo for iOS and Android
- React Context to store user/account getting across all of web & mobile components.
- Tailwind as a shared styling language over React & React Native (thanks to twrnc)
- As little logic as possible is done on the frontends. Business logic, utilities, permissions, etc are moved to the backend where it is safer and automatically shared between clients
- Remix/React Router for web, React Navigation for mobile: Navigating between pages are _not_ shared in order to feel native to web/mobile clients.
- Pages & Components: Over the years we have struggled to keep React Native pages and Web pages in sync over our massive feature set. For this reason, we experimented and then switched to mounting our web app into a React Native "shell". This gave us native page animations, Tab bars, stacks, etc, but helped us de-duplicate page UI & logic. We have learned to inject the native shell's state into the webview's UI for an instant page load and a near-native feel. Most of our users did not notice when we switched them from React Native pages to Webview pages, but they did notice that they suddenly had access to expanded, better-debugged functionality.
- Cypress e2e tests for "critical path" flows on web (apply, login, transfer, etc), enforced by CI, which is then re-used on mobile.

## The stack pt 2: All-Javascript API

![](/assets/efficiency/api.jpg)

- Hapi/Node, a single server running all code for checking, savings, loans, donations, webhooks, joint checking, joint savings, commercial savings, etc
- Heroku, as little time as possible on DevOps
- BullMQ & Redis: A single job queue for all features: checking, savings, loans, commercial, cron jobs, etc
- PSQL database, no time for non-relational systems here
- Updated & audited packages and Node versions to unlock newest features & ensure security
- Jest unit tests of critical-path functions (underwrite loan, transact, etc), enforced by CI.
- Git monorepo with web/mobile/api. 

## Landing Page, dashboards & process

![](/assets/efficiency/landing_page2.png)

- [Webflow](https://webflow.com) CMS for static landing pages
- [Retool](https://retool.com) dashboard to access server jobs, and to detect fraud, approve users, approve loans, see growth, etc.
- [Sendgrid](https://sendgrid.com) for both transactional emails and marketing emails. We don't have time to synchronize contact lists and content between Sendgrid and Mailchimp and Sendgrid single-sends are good enough.
- If a task needs to be done we hand-perform it, the second time we write a server job for it, and if needs to be done a 3rd time we write an interface for that server job, so that engineering never needs to be pulled into (read: block) the loop again.

## Alternatives

In a perfect world we'd have a single codebase that renders everything server-side in a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern customer expectations of native apps on iOS, Android & web - we needed to balance efficiency with competitiveness.

- Flutter, Flutter on web, Dart server - Notes: 1 language, Dart on backend is less established, Flutter on web is unfinished.
- React for web, Ionic React iOS & Android, Express server - Notes: 1 language, less native feel on mobile which is primary platform for 50% of users
- Rails for web, iOS, Android & server (Hey.com Style), with the mobile app's navigation rendered natively. Notes: 1 language, New approach, Maybe once battle-tested?, We try to pick boring technology as described above :)

## Conclusion

In summary, the Atmos stack will not be perfect for every software project but it is strongly recommended for tiny startups. It has allowed us to deliver way more value to customers per engineering hour than any other solution currently available.
