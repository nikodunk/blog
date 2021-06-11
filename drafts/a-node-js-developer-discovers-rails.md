---
layout: post
title:  "A NodeJs/React developer discovers Ruby on Rails"
date:   2021-06-10 08:00:00 -0700
tags: ["Essay"]
image: /chicago/Winslow_Homer_The_Herring_Net.jpg
---

## Intro 

Coming from a business background and having learned to code during the current [NodeJS](http://expressjs.com)/[React](https://reactjs.org)/[Hugo](https://gohugo.io) era makes discovering [Ruby on Rails](https://rubyonrails.org) like a revelation [1].

By day I work for a Node/React based company called [Atmos](https://www.joinatmos.com), and have worked in that stack on all my previous startups and projects. On the side, I am building a [B2B market place for manufacturing in the US](https://www.reshore.app). 2 hours in to setting up Express, Psql, EJS, Knex, etc again and having a simple 'hello world' to show for it I decided to give Rails a whirl. Over the years I’ve heard a lot about Rails on [HN](https://news.ycombinator.com) and "HOLY COW"! My Developer Happiness (© Ruby mid-1990s) has gone through the roof since I started using it for my new side project.

## Learnings

Building a web app in Rails took me 2 days for the same thing I would have built in Node in 2 weeks. Further, there are things in my web app on Rails I wouldn’t even have attempted to built on Node/Express until I proved the idea out more (editing a profile? Psht please - I’ll wait till someone requests that). I can honestly say I felt like a happy, productive developer with god-like powers as opposed to a annoyed grimm startup bro trying to hack together an MVP in order to get to launch.

As I said I come from a business background, so I don’t regret starting off with Node/React (with Hugo for static stuff) because because I’ve learned all the basics (raw SQL, ORMs, auth, testing, Sockets, migrations, how to structure a project) from scratch and have at this point built authentication, CRUD, etc about 10 times for every new green field project. I’ve also had to fill in a bunch of the computer science to learn why I'm gluing this all together, and had to pick through _chaotic_ React code bases I inherited and updating 'severless' Firebase backends with Google Cloud Functions (this used to be simple!) and 'optimizing React apps for SEO' (if you need SSR, why was it built in React in the first place). Which now makes me really appreciate the magic of Rails doing it all for me.

Critically, it allows me to actually think about the product I’m developing - _and build it at the speed of thought_ - as opposed to getting stuck in the weeds as I often do a Node project. If I receive customer feedback that something needs to be different already being locked in to a specific design system.

## Conclusion & Outlook

I wonder if why so many of the big software companies that on our household names were started around 2007 to 2012 simply because Rails enabled founders Back then to build more efficiently and not worried about ORMs. Or maybe I’m taking this pattern too far and there is no difference in companies being started and the new startup companies of today (YC batch 2021, B2B SaaS) will turn out to be just as life-changing as the last generation (Airbnb, GitHub, Shopify, Twitch, Flexport etc) once they have matured. Or maybe the market has changed and matured so much it’s not a fair comparison.

On the other hand, as Paul Graham [mentions](http://paulgraham.com/avg.html) - speed of iteration is important. Which is hard to do when I'm battling Knex.

Either way I feel like I’ve struck on a magical treasure from the past and you can pry it from my cold dead hands.

[1] - I use Node interchangeably with Express and Hapi, the main two frameworks I’ve used. I’m aware that the equivalent framework to Express is probably Sinatra in the Ruby ecosystem, and I’m not fairly comparing the two. But as we know there is not true JS equivalent to Rails (no, it’s not Sails).