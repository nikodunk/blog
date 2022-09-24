---
layout: post
title: "Essay: The tiny-team framework: How ATMOS optimized its tech stack around extreme efficiency"
date: 2022-05-10 08:00:00 -0700
tags: ["Essay"]
---

The [Atmos](https://www.joinatmos.com) stack is not something special, but it's optimized around something else than most fintech startups of our size have: not around best technology for the job, not around best user experience (though that's a second-order effect), but around sharing code and human resource efficiency.

We unified our stack around JS for maximum deployment efficiency and launched a bank w/ 10,000+ customers with only 1.5 FTE engineers and outlasted competitors. Our goal was always that one single developer could maintain and improve api, web, android, ios, loans - a single developer is with 10-20x less resources than similar competitors threw at the effort.

With so few engineers to do so much work, we need to be brutally efficient. In a perfect world we'd have a single codebase that renders everything server-side and a [majestic monolith](/a-node-js-developer-discovers-rails/) and use a [one-person framework](https://world.hey.com/dhh/the-one-person-framework-711e6318), but due to modern requirements of native apps on 2 platforms, native web experience for specific use cases, and of course still a bunch of protected logic on the backend, plus then a whole 2nd product to lend out the deposits that we're collecting - we needed to balance efficiency and DRYness with reality.

Our stack has allowed us to ship a large amount of features (savings, checking, loans, donations clients on web, ios, android) rapidly, with a minimum of bugs and a maximum of testing.

Javascript frontends - React & React-Native:

    - Clients monorepo (need to tweak Metro config to allow Expo to access /common folder in web. CRA, which web was created in, wont allow any imports from outside /src folder, and wanted to stay on mainline CRA)
    - Separate & native-feeling, React & React-Native views, navigators & view logic. For a while I wanted to unify these too and deploy mobile with react-native-web, but I'm glad I couldn't get this through - didn't feel native enough. Tailwind was sufficient if really needed to port features & views from mobile => web.
    - Common shared components in redux (api/state logic), tailwind, utility functions, permission config, etc.
    - Integration test coverage, enforced by CI on every merge to develop.
    - When launching mobile, we quickly merged it into our web codebase/repo to benefit from shared logic, and improvements to mobile improving web.
    - When adding our second product (loans), we merged this into the main web repo almost immediately to piggyback off the devOps of the main product (bank), and also so that the bank could benefit from the component improvements made while engineering a brand new product. Massive design and performance improvements resulted from this, including the removal of Material-UI which we'd originally launched on and going with Tailwind.

Javascript API - Node (Hapi & Bull Queue) running on Heroku:

    - Aggressively updated packages & stacks to newest versions to unlock newest features & ensure security, enabled by next point.
    - Integration test coverage of critical path user flows (apply, login, transact), enforced by CI on every merge to develop or package update.
    - When adding our second product (loans), we merged this into the main web repo almost immediately to piggyback off the devOps of the main product (bank), and also so we could benefit from improvements made for loans: Bank received non-blocking account opening and tons of dead code removal.

Other:

    - Webflow for landing pages
    - Retool to access to numberous admin api functions to detect fraud, approve users, approve loans, see growth, etc. There's a goal to hand-perform a task that needs to be done once, if it happens a second time we write an api job for it, and if it happens a 3rd time we write an interface for that api job, so that engineering never needs to be pulled into (read: block) the loop again.

## Benefits of a unified stack

- Copy paste code from the web, mobile, server
- Use the same libraries on the web, mobile, server
- Use similar testing syntax
- Less onboarding for engineers
- Library updates on one benefit the other (ie. Node), downside: lib updates block the other
- Dogfooding mobile dogfoods web too - if one team member dogfoods web and another team member dogfoods mobile, we'll have pretty good coverage - especially since most of the code is shared.
- Partially related to the above - we [chose boring technology](https://boringtechnology.club/), and benefitted from all the upsides metnioned in the talk: devops improvements to one part of our company benefited another, unifying around React lead to us improving already-built products while building out new products, etc etc.
