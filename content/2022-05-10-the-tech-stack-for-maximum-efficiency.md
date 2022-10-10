---
layout: post
title: "How a unified tech stack helps our tiny team punch above its weight"
date: 2022-09-23 08:00:00 -0700
tags: ["Essay"]
image: /efficiency_dalle.png
---

![](/efficiency_stack.jpg)

The following system has helped [Atmos](https://www.joinatmos.com) grow to 10,000+ customers with only 1-2 full-time-equivalent engineers. Thanks to it we've stayed secure and [iterated rapidly](http://paulgraham.com/avg.html). We need to be 10-20x more efficient than our closest competitors as our engineering team is 10-20x leaner than theirs.

We mainly stay efficent by reducing mental overhead and reducing maintenance burden. Our products are numerous - web, ios, android for savings, checking, loans, deposits, jobs - and yet a single developer should be able to understand, maintain and improve all of them.

## More wood behind fewer arrows

We unified our stack around Javascript on clients and server for maximum code efficiency - we do not have time to duplicate features over Kotlin, Swift, Svelte and Python for various parts of the stack. We have one server running all code for all projects - we do not have time for microservices. We even have large parts of our frontend logic shared between web and mobile - we don't have time to write things (and more importantly debug things!) twice.

All functions are written in the exact same super-simple code style whether they are on web, mobile or server. We use as few abstractions as possible, and use the same simple query syntax right throughout the server, apps, etc. Simpler, less abstracted code also seems to lead to fewer bugs, duh.

We use as few libraries as possible, and when necessary we use simple, well-tested ones that will work on server, mobile and web. This way library updates on one part of the stack benefit another, as mentioned in the great [Boring Technology](https://boringtechnology.club/) talk, and unifying around React and Hapi makes us improve existing products while building new ones (see cross-pollination below). There are also way fewer dependencies to understand, learn how to use and audit. The downside is that library updates block each other, and we are deeply invested in a single library for a task.

We share code between products wherever possible. Similar logic on web, mobile and server goes in a shared Atmos library where all parts of the stack can access it. This way a single change or bug fix to a permission error fixes it everywhere in the stack and things stay in sync. We can also move code and tests between web, mobile, server as necessary.

Each code base receives good internal testing coverage because our internal testers are only spread out over very few code bases. It’s highly likely that even bugs in obscure code paths will be discovered internally for two reasons. First, most team members use the product every day as their personal bank so we’ll notice obvious issues quickly before they affect users. Second, because most of the business logic is shared, using an obscure feature on web provides basic mobile testing coverage for that feature too. For example, a team member using iOS check deposit will find a refactor broke permissions before Android users can notice in the wild. This is on top of automated testing we do anyway.

We have seen much cross-pollination by merging code bases. We merged the mobile code into our web code to share business logic. But improvements made to mobile components improved the web experience too. Similarly, we merged the loans client into the original client to piggyback off its DevOps. But again the original product gained the design improvements made while engineering the new product (web-only Material-UI was replaced with universal Tailwind in this case). The original server benefitted from improvements from the new loans server too. It gained non-blocking account opening and much dead code removal.

A breakdown of the stack is below.

## The stack pt 1: All-Javascript iOS, Android & Web apps

- React on web, iOS and Android. Client-rendered React for web, React Native/Expo for mobile. Regularly updated and audited dependencies.
- Monorepo for the two client projects, sharing a /common folder of shared logic, utility functions, math, permissions, etc etc
- Tailwind as a shared styling language over React & React Native (thanks to twrnc)
- Redux as a shared api request/state logic library.
- Routing is one thing that is _not_ shared at all in order to feel native: React Navigation on mobile vs. React Router for web.
- Jest running automated integration tests for "critical path" features like application, login, transfer, etc on the CI for both web & mobile on every commit.

## The stack pt 2: All-Javascript API

- Node/Hapi, a single server running all code for savings, checking, loans, donations
- Heroku, so as to use as little time as possible on DevOps
- BullMQ & Redis: A single jobs queue for all features: deposits, loans, monthly jobs, etc
- Postgres database, no time for non-relational systems here
- Regularly updated & audited packages including Node versions to unlock newest features & ensure security
- Integration test coverage of critical path user flows (apply, login, transact), enforced by CI.

## Other: Landing Pages & Internal dashboards

- Webflow CMS for static landing pages
- Retool dashboard to access server jobs, and to detect fraud, approve users, approve loans, see growth, etc. If a task needs to be done we hand-perform it, the second time we write an server job for it, and if needs to be done a 3rd time we write an interface for that server job, so that engineering never needs to be pulled into (read: block) the loop again.

## Alternatives

In a perfect world we'd have a single codebase that renders everything server-side in a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern customer expectations of native apps on iOS, Android & web - we needed to balance efficiency with competitiveness.

- Flutter, Flutter on web, Dart server - Notes: 1 language, Dart on backend is less established, Flutter on web is unfinished, Google's commitment to any project?
- Swift iOS, Kotlin Android, Django/Rails for Web & server - Notes: 3 languages, but all completely native. Lose most benefits from this article.
- React for web, Cordova React iOS & Android, Express server - Notes: 1 language, less native feel on mobile which is primary platform for 50% of users
- Rails for web, iOS, Android & server (Hey.com Style), with the mobile app's navigation rendered natively. Notes: 1 language, New approach, Maybe once battle-tested?, We try to pick boring technology as described above :)

## Conclusion

In summary, our Atmos stack will not be perfect for every software project but it is strongly recommended for tiny startups. It has allowed us to deliver way more value to customers per engineering hour than any other solution currently available.
