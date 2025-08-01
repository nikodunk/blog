---
layout: post
title: "From Node to Ruby on Rails"
date: 2021-06-10 08:00:00 -0700
tags: ["Essay"]
---

I learned to code in the Javascript stack [1] and am building a Javascript based [product](https://www.joinatmos.com/?ref=nikodunk) [2]. I never questioned this stack: many companies default to it, JS everywhere seems good, and the community is big. But for my [new side project](https://cars.electrade.app/) I decided to try Rails because despite some perception that Ruby on Rails is ‘over’, people in HN comments say it was somehow more enjoyable than the newer Node based stack. Having tried it I can say wow - coming from the current Javascript ecosystem makes discovering Rails a revelation.

## Happiness

Building the web app in Rails took me 2 days – the same thing in Node would have taken 2 weeks. I’ve also included things I wouldn’t have attempted to build on Node/Express until I proved the idea out (editing a profile? Psht please - I’ll wait till someone requests that). People in the HN comments always accuse the Node ecosystem of making you re-invent the wheel for every project. But I thought that was just the way things were. Now I realize the truth to their words.

I feel like a productive founder building a pleasant product with god-like speed instead of a grim developer taking shortcuts to an MVP.

It turns out that while the uninitiated don’t consider it the newest technology, a happy subculture of entrepreneurs and corps keep Rails more than up to date. They keep adding amazing new features like an easy to use Websockets implementation. Or a reactive app technology called Hotwire. It’s like discovering a secret society that’s been hiding in plain sight.

## Plumbing with JS frameworks

I decided to try Rails after writing boilerplate in Node for two hours with Express, Postgres, EJS, Knex, etc and having a simple ‘hello world’ to show for it.

I come from a business background, so the upside to learning development in the ‘current’ JS era is that there’s no way around learning some plumbing. React and Express are ‘un-opinionated’, which means they force you to pick all the components and connect them together yourself. You have to know a little about what you’re doing. I’ve learned all the basics because of this - things like raw SQL, ORMs, auth, testing, Websockets, migrations, how to structure a project. I’ve wired up CRUD and authentication 10 times for every new green field project I’ve worked on. Starting with Rails may not have given me this in-depth understanding.

The downside to understanding the plumbing is that I’ve thought a lot about plumbing instead of other stuff. Which is great for an engineer. But as a founder I’ve always found it hard to climb out of the plumbing, forget about it, and think about what the user wants. It’s hard to keep my eye on a wonderful product experience when I’m battling Knex or Redux.

## Rails opens doors

But Rails magic is handling plumbing on my new project. What opportunities does this open up? I think there are mainly two:

Better computer science - I can focus more on learning useful patterns to create with the framework vs. how to set it up. Computer science is not plumbing.

Better business - Rails allows me to think about the product I’m developing - and build it at the speed of thought - instead of getting stuck in the weeds as I often do with a Node project. When I receive customer feedback i can move things effortlessly or scrap them mercilessly.
I can even think like a user while I’m engineering it. This is the true magic of Rails for me so far: I can use both my left brain and my right brain. The high-level framework frees up enough headspace to think about what I’m building instead of how I’m building it. I can build things with such ease that I have headspace to think about the experience - so things don’t look like they were ‘designed by an engineer’ anymore.

## Conclusion & Hypothesis

I wonder if I’d started building software a decade earlier and defaulted to Rails I would have focused more on the user experience and business case of my products and found more success with them. Maybe I could have focused more on why instead of how.
I wonder if this helped some of my favorite companies from the 2005-2012 era succeed when they were building their initial products with Rails (Airbnb, GitHub, Shopify, Twitch, Flexport etc). Did Rails enable their founders to build more efficiently and not worry about plumbing? Did it allow them to focus on what users wanted instead of plumbing? Is that why they were so successful? Paul Graham mentions [3] Lisp was key in helping Viaweb outmaneuver their competitors due to its efficiency a generation before that.
Or maybe high and low level frameworks make no difference: Maybe there’s just as many unsuccessful projects built with Rails, and the current Node-based products will be just as successful in a few years. Or maybe the internet market has matured so much since 2007 that it’s unfair to compare the cohorts.

Time will tell whether Rails is going to make me build better and more successful products by focusing on the right things. Either way I feel like I’ve struck on a magical treasure from the past and will not willingly give it up.

---

[1] - By JS everywhere I mean Express/React with Hugo for static which is a pretty common stack. In the following I’ll use Node interchangeably with Express and Hapi, the main two frameworks I’ve used. I’m aware that the equivalent framework to Express is probably Sinatra in the Ruby ecosystem, and I’m not fairly comparing the two. But as we know there is not true JS equivalent to Rails (no, it’s not Sails).

[2] - https://www.joinatmos.com runs on Node/React/Redux/React Native

[3] - http://paulgraham.com/avg.html

---

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">“Having tried it I can say wow - coming from the current Javascript ecosystem makes discovering Rails a revelation. Building the web app in Rails took me 2 days – the same thing in Node would have taken 2 weeks.” <a href="https://t.co/hQhK60G1z8">https://t.co/hQhK60G1z8</a></p>&mdash; DHH (@dhh) <a href="https://twitter.com/dhh/status/1471470830265589763?ref_src=twsrc%5Etfw">December 16, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

---

**[This article was also discussed on Hacker News](https://news.ycombinator.com/item?id=29577897)**
