---
layout: post
title:  "From Node to Ruby on Rails"
date:   2021-06-10 08:00:00 -0700
tags: ["Essay"]
image: /chicago/Winslow_Homer_The_Herring_Net.jpg
---

I learned to code in an all-Javascript tech stack and work for an all-JS [company](https://www.joinatmos.com) (Node/React/React Native). I never questioned that this stack is a good default: a lot of software companies use it, it's new and shiny, JS everywhere is good, and it gets things done. But for my new [side project](https://www.reshore.app) I decided to try Rails because developer friends always say how easy it was to use, how the Node ecosystem makes you re-invent the wheel for every project, and that despite some perception that Ruby on Rails is 'over' it was somehow more enjoyable. And _wow_. Coming from the current Node ecosystem makes discovering Rails a revelation [1].

## Happiness

Building the web app in Rails took me 2 days – the same thing in Node would have taken 2 weeks. Further, I've included things I wouldn’t have attempted to built on Node/Express until I proved the idea out (editing a profile? Psht please - I’ll wait till someone requests that).

I feel like a happy, productive founder with god-like powers instead of a grim developer taking shortcuts to his launch-worthy MVP.

## Plumbing with JS frameworks

I decided to try Rails after 2 hours of setting up the new project in Node with Express, Postgres, EJS, Knex, etc and having a simple 'hello world' to show for it.

I come from a business background, so the upside to learning development in the 'current' JS era is that there's no way around learning some plumbing. React and Express are 'un-opinionated', which means they force you to pick all the components and glue them together yourself. You have to know a little about what you're doing.

I’ve learned all the basics because of this - things like raw SQL, ORMs, auth, testing, Websockets, migrations, how to structure a project. I've wired up CRUD and authentication 10 times for every new green field project I've worked on. Starting with Rails may not have given me this in-depth understanding.

So I understand the plumbing well. Which is great for an engineer. But as a _founder_ it's hard to climb out of the plumbing, forget about it, and think about what the _user_ wants. It's hard to keep my eye on a wonderful product experience when I'm battling Knex.

## Rails opens doors

But Rails magic is handling plumbing on my new project. What opportunities does this open up? I think there are two:

Better computer science - I can focus more on learning useful patterns to create with the framework vs. how to set it up. Computer science is not plumbing. 

Better business - Rails allows me to think about the _product_ I’m developing - _and build it at the speed of thought_ - instead of getting stuck in the weeds as I often do with a Node project. If I receive customer feedback that something needs to be different things can be moved effortlessly or scrapped completely. 

I can sometimes even think like a user while I'm engineering it. This is the true magic of Rails for me so far: I can use both my left brain and my right brain. The high-level framework frees up enough headspace to think about _what_ I'm building instead of _how_ I'm building it. I can build things with such ease that I have headspace to think about design - so the things don't look like they were 'designed by an engineer' anymore.

## Conclusion & Hypothesis

I wonder if I'd started building software a decade earlier and started with Rails I would have built better, more user-friendly products sooner. And this would have lead to more business success, due to more focus on the user experience and business case. More focus on _why_ instead of _how_. 

I wonder if this is how the companies I admire from the previous era felt when they were building their initial products with Rails (Airbnb, GitHub, Shopify, Twitch, Flexport etc). Did Rails enable their founders to build more efficiently and not worry about plumbing? Did it allow them to focus on what users wanted, as opposed to plumbing? Is that why they were so successful? Paul Graham [mentions](http://paulgraham.com/avg.html) Lisp was key in helping Viaweb outmaneuver their competitors due to its efficiency a generation before that.

Or maybe I’m taking this pattern of 'Rails builds great businesses' too far: I've forgotten the horrible projects that were built with Rails. Or current Node-based products will be just as loved. Or maybe the internet market has matured so much since 2007 that it’s fair to compare the cohorts. 

Time will tell whether Rails is going to make me build better and more successful products. Either way I feel like I’ve struck on a magical treasure from the past and will not willingly give it up.

-----

<small>[1] - By JS everywhere I mean [Express](http://expressjs.com)/[React](https://reactjs.org) with [Hugo](https://gohugo.io) for static which is a pretty common stack. In the following I'll use Node interchangeably with Express and Hapi, the main two frameworks I’ve used. I’m aware that the equivalent framework to Express is probably Sinatra in the Ruby ecosystem, and I’m not fairly comparing the two. But as we know there is not true JS equivalent to Rails (no, it’s not Sails).</small>