---
layout: post
title: "Essay: The Atmos Stack: How we unified our stack around JS for maximum fintech startup efficiency"
date: 2022-05-10 08:00:00 -0700
tags: ["Essay"]
---

...and launched a bank w/ 10,000+ customers with 1.5 engineers.

With so few engineers to do so much work, we need to be brutally efficient. In a perfect world we'd have a single codebase that renders everything server-side, but due to modern requirements of native apps on 2 platforms, web apps, and of course still a bunch of protected logic on the backend, we needed to balance efficiency and DRYness with reality.

Our stack has allowed us to ship a large amount of features (savings, checking, loans, donations) on multiple platforms rapidly, with a minimum of bugs and a maximum of testing.

Javascript frontends - React & React-Native:

    - Clients monorepo (need to tweak Metro config to allow Expo to access /common folder in web. CRA, which web was created in, wont allow any imports from outside /src folder, and wanted to stay on mainline CRA)
    - Separate & native-feeling, React & React-Native views, navigators & view logic. For a while I wanted to unify these too and deploy mobile with react-native-web, but I'm glad I couldn't get this through - didn't feel native enough. Tailwind was sufficient if really needed to port features & views from mobile => web.
    - Common shared components in redux (api/state logic), tailwind, utility functions, permission config, etc.
    - Integration test coverage, enforced by CI on every merge to develop.
    - When adding our second product (loans), we merged this into the main web repo almost immediately to piggyback off the devOps of the main product (bank), and also so that the bank could benefit from the component improvements made while engineering a brand new product. Massive design and performance improvements resulted from this, including the removal of Material-UI which we'd originally launched on and going with Tailwind.

Javascript API - Node (Hapi & BullMQ) running on Heroku:

    - Relatively aggressively updated packages & stacks to newest versions to unlock newest features & ensure security, enabled by next point.
    - Integration test coverage of critical path user flows (signup, login, transactions), enforced by CI on every merge to develop or package update.
    - When adding our second product (loans), we merged this into the main web repo almost immediately to piggyback off the devOps of the main product (bank), and also so we could benefit from improvements made for loans: Bank received non-blocking account opening and tons of dead code removal.

Other:

    - Webflow for landing pages
    - Retool to access various admin api functions to detect fraud, approve users, approve loans, see growth, etc.
