---
layout: post
title:  "A JS developer discovers Ruby on Rails"
date:   2021-06-10 08:00:00 -0700
tags: ["Essay"]
image: /chicago/Winslow_Homer_The_Herring_Net.jpg
---

I work for a Node/React based [company](https://www.joinatmos.com) and have worked in the JS stack for years. But for my new [side project](https://www.reshore.app) I decided to give Rails a whirl. Over the years I’ve heard a lot about Rails on [HN](https://news.ycombinator.com) and "HOLY COW"! My Developer Happiness (© Ruby mid-1990s) has gone through the roof since I started using it.

Having learned to code during the current 'JS everywhere' era makes discovering [Ruby on Rails](https://rubyonrails.org) a revelation [1].

## Happiness

Building a web app in Rails took me 2 days for the same thing I would have built in Node in 2 weeks. Further, I've included things I wouldn’t have attempted to built on Node/Express until I proved the idea out (editing a profile? Psht please - I’ll wait till someone requests that).

I feel like a happy, productive developer with god-like powers instead of an grim founder taking shortcuts to a launch-worthy MVP.

## On plumbing with JS frameworks

I decided to try Rails after 2 hours of setting up the new project in Node with Express, Postgres, Ejs, Knex, etc and having a simple 'hello world' to show for it.

I come from a business background, so the upside to starting to build web software in the 'current' JS era is that there's no way around learning some plumbing. React and Express are 'un-opinionated', which means they force you to pick all the components and glue them together yourself. You have to know a little about what you're doing.

I’ve learned all the basics because of this - things like raw SQL, ORMs, auth, testing, Websockets, migrations, how to structure a project and I've wired up CRUD, authentication 10 times for every new green field project I've worked on - with Rails I may not have had this in-depth understanding.

I understand the plumbing well thanks to this. Which is great for an engineer. But as a _founder_ it's hard to climb out of the plumbing, forget about it, and think about what the _user_ wants. It's hard to keep my eye on a wonderful product experience when I'm battling Knex.

## Rails opens doors

But Rails magic is handling plumbing on my new project. What opportunities does this open up? I think there are two:

Better computer science - I can focus more on learning useful patterns to create with the framework vs. how to set it up. Computer science is not plumbing. 

Better business - Rails allows me to think about the _product_ I’m developing - _and build it at the speed of thought_ - instead of getting stuck in the weeds as I often do with a Node project. If I receive customer feedback that something needs to be different. I can think like a user while I'm engineering it. 

This is the true magic of Rails for me so far: I can use both my left brain and my right brain. The high-level framework frees up enough headspace to think about _what_ I'm building instead of _how_ I'm building it. I can build things with such ease they don't look like they were 'designed by an engineer'.

## Conclusion & Hypothesis

I wonder if I'd started building software a decade earlier and started with Rails I would have built better, more user-friendly products. With less pain. And with more focus on the user experience and business case. The _why_ instead of the _how_. 

I wonder if this is how the companies I admire from the previous era felt when they were building their initial products with Rails (Airbnb, GitHub, Shopify, Twitch, Flexport etc). Did Rails enable their founders to build more efficiently and not worry about plumbing? Did it allow them to focus on what users wanted, as opposed to plumbing? Is that why they were so successful? Paul Graham [mentions](http://paulgraham.com/avg.html) Lisp was key in helping Viaweb outmaneuver their competitors due to its efficiency.

Or maybe I’m taking this pattern too far: I've forgotten about the horrible projects that happened on Rails, current companies will be just as loved, or the market has matured so much it’s not a fair comparison. Time will tell whether Rails is going to make me build better products.

Either way I feel like I’ve struck on a magical treasure from the past and will not willingly give it up.

-----

[1] - By JS everywhere I mean [Express](http://expressjs.com)/[React](https://reactjs.org) with [Hugo](https://gohugo.io) for static which is a pretty common stack. In the following I'll use Node interchangeably with Express and Hapi, the main two frameworks I’ve used. I’m aware that the equivalent framework to Express is probably Sinatra in the Ruby ecosystem, and I’m not fairly comparing the two. But as we know there is not true JS equivalent to Rails (no, it’s not Sails).