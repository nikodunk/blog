---
layout: post
title:  "Learnings: Things I've made so far."
date:   2019-01-16 08:00:00 -0700
tags: ["Learnings", "Updates"]
---

This is a general blog post on my various schemes so far, loosely grouped around topic. I look like this when I've made something:

![](/learnings/gianni_colombo.jpg) ![](/learnings/scientist.jpg)




# Health
--------------------------------------------------------------------------------------------------------------

### ![](/learnings/logo_paperworklabs.png) paperworklabs.com | Turbotax for medical forms


See ongoing progress in the newer posts on this site, like [this one](/startup-updates-1)

Together with my cofounder, we came up with the idea for Paperwork Labs when he was describing the challenges physicians are facing with government paperwork like the 18-page CPSP forms of California. I built a simple "turbotax for medical forms" in Node in early December, created the below video, and had on initial clients by end of January. Price point: $99/mo/login for all-you-can-eat, constantly updated "smart forms" that can export flat PDFs, report on your "structured data", and potentially integrates with EHRs if they let us.

	Tech
	* PERN web stack:
	* React frontend
	* Node/Express/Postgres backend
	* Docker on AWS Elastic Beanstalk
	* HIPAA compliant encryption, access monitoring

	Stats
	* Price point: $99/month for all-you-can-eat medical smartforms


* [Paperwork labs link](https://www.paperworklabs.com)


<iframe width="560" height="315" src="https://www.youtube.com/embed/IZHnqU43t0s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


---------

### ![](/learnings/logo_health.png) Soap Dictate App | Auto-transcribe your SOAP notes

Soap dictate was built to help my friend Libo at Stanford Internal Medicine save time on note taking (aka medical charting or documentation) with a mobile app to dictate into templates.

Doctors currently spend around 2 hours a day after their shift typing up notes at the ward desktop, or catching up at home. This app enabled them to save at least an hour of this time by quickly dictating their notes into their phone during their shift, and making it very easy to copy-paste their notes into the EMR system once they’re done. The idea was to help physicians save an hour a day for $9.99 a month. 

The app was actually downloaded by massage therapists, acupuncturists and psychotherapists, who wanted to export PDFs and emails, for $3.99 per month. Took down after 3 months because the HIPAA situation of Apple's Speech Recognition API is unclear – technically HIPAA compliantly encrypted, but as Apple would never sign a BAA, not a risk I wanted to take on as the above project took off...

	Tech
	* React Native App
	* Mobile Frontend in React Native with RNVoice library
	* Web Frontend in React at http://soapdictate.com (currently replaced with simple static site)
	* Backend in Node/Express/Postgresql backend running on Heroku (currently removed)

	Stats before shutdown
	* Paying customers: 9
	* Trial customers: 4
	* MRR: $31.92
	* Price point: $3.99/month
	* 171 registered users
	* Organic app store search

* [App Store Link](https://itunes.apple.com/app/id1384252497)



![](/learnings/demo_health3.gif)

![](/learnings/soapstats_1.png)
![](/learnings/soapstats_2.png)
![](/learnings/soapstats_3.png)








# Sustainability
--------------------------------------------------------------------------------------------------------------


### ![](/learnings/logo_sustainability2.png) electrific | EV Price Tracker & Charging Map App



	Tech:
	* React-Native App
	* Dynamic pricing data scraped with APIfy.com
	* Mapping data from OpenChargeMap.com

	Stats
	* Users: 0


* [App Store Link](https://itunes.apple.com/us/app/id1445602414)


![](/learnings/electrific1.png)
![](/learnings/electrific2.png)


### ![](/learnings/logo_sustainability1.gif) sunboxlabs.com | Solar Price Tracker & Platform for DIY solar

With Zebulon Reynolds (for part of the way), this project <a href="http://sunboxlabs.com" target="_blank">sunboxlabs.com</a> developed out of a <a href="https://hackernoon.com/200-for-a-green-diy-self-sufficient-bedroom-that-your-landlord-wont-hate-b3b4cdcfb4f4">HackerNoon</a> post from a hacked together project, implemented between jobs, where it garnered 200'000 views and was featured on <a href="https://news.ycombinator.com/item?id=15216650" target="_blank">HackerNews</a> (<a href="https://news.ycombinator.com/item?id=15216650" target="_blank">twice</a>!) and /r/geek. The project was trying to solve the same as the Solar/Battery Hardware project below (the problem of solar in cities), but this time I took a content/software-only approach. No hardware overhead! <a href="http://nikodunk.github.io/sunboxlabs">sunbox labs</a> was a Jekyll site with React components that helps hackers build their own personal power plants with components off Amazon. Also on this blog at <i><a href="/solar">$200 Solar Self-Sufficiency – without your landlord noticing</a></i>.



	Tech:
	* Static Hugo Site 
	* Dynamic pricing data scraped from Amazon with APIfy.com
	* User submitted content

	Stats
	* 204'600 uniques from July 2017 - July 2018
	* 3.74% conversion to Amazon affiliate program
	* MRR: ~ $20.00
	* 2 versions of kit launched

* [Sunboxlabs.com Site](http://sunboxlabs.com)

![](/learnings/sunboxlabssite2.png)
![](/learnings/sunboxlabssite.png)
![](/learnings/demo3.png)
![](/200/COMPONENTS.jpg)








### ![](/learnings/logo_sustainability.png) GoodGood | B-Corp Price Tracker

Utilising APIfier to scrape all B-Corp companies, and cross-referencing them with price and product information from the Viglink API, a search engine for green. It does this by indexing 2101 pre-vetted companies from various labels and certification sites and comparing their products with prices from the Viglink API. Certified Label Amazon Search and later EWG Database Amazon Search – Angular2 product comparison engines for sustainable products, drawing pricing & image data from Viglink API.

	Tech
	* Angular 2 app
	* Dynamic pricing & product data from Viglink API
	* B-Corps scraped from bcorporation.com with APIfy.com

* [Goodgood.io 1.0 Mirror](https://nikodunk.github.io/bamazon/)

![](/learnings/bamazon.gif)




# Misc Software
--------------------------------------------------------------------------------------------------------------


### Gift Lab | Kickstarter for physical donations

With Elisa Chan, a platform to help noprofits fundraise more efficiently with more transparency and new donation methods including Amazon Wishlists, Itemized budgets and corporate donations.


	Tech:
	* Node/Express/Postgresql web app on Heroku 
	* Stripe Connect for payment routing
	* Amazon wishlists for product gifting
	* Mixpanel/Fullstory analytics


* [The Gift Lab Site](http://giftlab.io)

![](/learnings/demo giftlab.png)


---------

### ![](/learnings/project-pegasus-logo.png) Project Pegasus | Recycling rejected YCombinator applications

![](/learnings/demo pegasus.png) ![](/learnings/demo pegasus 2.png)

With Can Olcer and Dorena Nagel. Connecting hand-picked startups with hand-picked angels, double-blind opt-in intros, investor pays $99 per intro. Startups can re-use their YCombinator application to apply to other angel investors.

	Tech:
	* Hugo Static Site, loads of email.

	Stats
	* 52 startups applied with old YC applications
	* 7 investors applied for insights into the startups
	* 4 rounds sent, suggesting 48 startups in total.



* [Project Pegasus Site](http://projectpegasus.io)

---------

### ![](/learnings/logo_health0.png) I Am Off! | Finding common days off for friend groups

Together with Libo Wang and initially Steven Pease, we set out to help with the burn-out rate of doctors at Stanford Internal Medicine: This app helps doctors (who have irregular schedules and little free time) work out who’s off and up to hang out with a super simple calendaring app.

	Tech
	* React Native App with Node Server:
	* Frontend in React Native/Redux
	* Backend in Node/Express/PostgreSQL

	Stats
	* 275 users at Stanford Medicine, Utah Medical, Harvard Medical, London, Rwanda.
	* 145 WAUs
	* Price: Free
	* Growth through internship onboardings, organic.

* [App Store Link](https://itunes.apple.com/us/app/i-am-off/id1378071021)
* [Google Play Link](https://play.google.com/store/apps/details?id=com.pokedoc.iamoff) 

![](/learnings/demo_health.gif) 
![](/learnings/demo_health.png)



# Misc Hardware
--------------------------------------------------------------------------------------------------------------



### ![](/learnings/logo_paper.png) Paper Inc. (my first company) – mail-order sustainable flatpack furniture (website/hardware)

The initial idea was to send furniture that’s made of paper through the mail to consumers. Paper Inc. was a furniture company to help mobile urbanites get a room full of furniture with the push of a button. We mailed you a folded “room in a box” that was easy to set up and could simply be recycled or sent back when you move.

![](/learnings/paper.png)

This project was born out of the frustration with the extremely expensive 5-axis process of milling the Lunch dining chair. It went to the other extreme. If wood is too expensive, and consumers like me balk at buying expensive furniture when we move every year in our twenties – could I make something more affordable that can simply be recycled the next time I move? I started with the business plan first. The business plan was simple: Connect all the beautiful cardboard furniture designs out there on the internet with manufacturers in Switzerland, and send them directly to the customer. I was specifically trying NOT to design a product, but to design a service this time round. The business plan won a cash prize at the Innovate4Climate 2014 investment, and pushed me and my co-founder, Benjamin Blum, into one of Zurich’s best clean-tech incubators. This was a differentiated product with a clear path.

We ended up pivoting to cnc-milled wood before we started out of fear that people wouldn’t want cardboard furniture. Maybe in retrospect thereby torpedo-ing our differentiation. This also pushed us up over the impulse-buy territory we’d previously occupied, and reduced the furniture’s lightweight mail-order nature. We renamed the project Smoke at the same time and offered all-in-one kits. We raised some pre-seed capital from Swiss Venture days 2015, but my co-founder jumped off back into the corporate world at the wrong moment and the investors re-scinded their offer. Looking back we should have stayed with the original, clear concept of paper furniture and run with it.

	Tech:
	* CNC-Milled furniture built in Rhinoceros modelling
	* Squarespace site

	Stats
	* I4C Clean-Tech Startup Accelerator Cohort ‘14
	* $10,000 in test-sales
	* Pre-Seed round (aborted)
	* My first ever entrepreneurial project


* [Smokefurniture.com Mirror](http://nikodunk.github.io/smoke/)

![](/learnings/smokesite.png) ![](/learnings/smoke.gif)  
![](/learnings/smoke.jpg)

---------



### Juicebar – (hardware concept)

Juicebar was a windowsill energy generator meant to ehlp urbanites be energy independent without access to their rooftops.

The pitch was that as an increasing part of the world’s population lives in dense cities, solar rooftops, which are designed primarily for suburbs, become hard to install. Renting an apartment means you mostly don’t have access to the roof. What you do have power over is your own windowsill. This was inspired by Rob Rhineharts blog-post <a href="https://arstechnica.com/gadgets/2015/08/op-ed-how-i-gave-up-alternating-current/" target="_blank">“How I gave up alternating current”</a>. The project turned into solar for apartment-owners so they could charge their devices off a dedicated DC battery, and create their own energy.

![](/learnings/juicebar.jpg) 
![](/learnings/juicebar.png)


Customers objected that the device was too expensive vs. what money they could save. They also objected that the embodied energy was so high, it would take years to pay off and be “greener” than before. Finally, they objected that the IoT features were useless.

The juicebar project originally came about in the dying days of Paper Inc.: I started playing around with added electrical components to differentiate the tables and chairs we’d already bought and hope to liquidate them on Kickstarter (below). Eventually I dropped the tables completely and went on with a pure window-sill design above. I also added an Arduino for good measure so I could track electrical production during the day (and because IoT funding was readily available…). I also got sucked up in the IoT craze (since this was technically an IoT product), and spent a lot of time pitching and filming, instead of improving the product. This was my first project where coding was involved, so I’m thankful for that. Many Alibaba-sourced 12V lithium batteries & panels were thrashed at this stage.


![](/learnings/juice.jpg)
![](/learnings/juice2.jpg)

---------

### LUNCH | A CNC-carved chair project

LUNCH, a digitally carved dining chair. Made on a 5-axis CNC in portugal, only 20 were ever made. Very expensive. I learned that making your own goods is a whole different operation from selling them.

![](/learnings/lunch.jpg)
![](/learnings/lunch.gif)	
![](/learnings/lunch2.jpg)
![](/learnings/lunch3.png)

---------


Student project, Thomas Meyer and I put in many man-hours into the leather-, copper- and woodwork necessary for this project.


![](/learnings/loungeforceone.jpg)  ![](/learnings/loungeforcetwo.jpg)







---------

### Other web tech demos

Focuswriter – VR productivity app for distraction-free writing, written in reactVR. Look around and type away as the text wraps itself around you. Be sure to click on the moon above your head to switch to GALAXYMODE.

	Tech
	* ReactVR
	
* [FocusWriter Web App](https://nikodunk.github.io/focuswriter-react-vr)


![](/learnings/demo2.gif)

---------

CollaborativeToDo was a React & Firebase to-do list app w/ full Drag n drop, CRUD. This was chiefly to solve a to-do list excel and email overload we were all suffering from at the office, and let these lists be easily shared and collaborated on between team members.

	Tech
	* React
	* Firebase

* [CollaborativeTodo Web App](https://nikodunk.github.io/simple-to-do-react)

![](/learnings/demo.gif)

---------

<a href="https://github.com/nikodunk/solar-search-swift">Solar Summon</a> – Solar search for iOS drawing from MapKit, and <a href="https://github.com/nikodunk/reactnativesolar">Solar Summon</a> – Later Rebuilt in React Native. These were my first iOS projects in Swift and React Native.


![](/learnings/demo4.gif)

---------

### Goodgood | Sustainable Cosmetic Price Tracker

GoodGood, a software project to help families find skinsafe products for their babies, by cross-referencing EWG's safe skincare products.

	Tech
	* Angular 2 app
	* Firebase backend
	* Viglink API
	* APIfier to scrape ewg.org (and save it into Firebase)

* [Goodgood.io Mirror](https://nikodunk.github.io/ewg-search/)

![](/learnings/goodgood.gif)


----------


### Superjuice 2 | Producthunt for sustainable products

A “product hunt” for the videos of certified green companies. This initial version involved no scraping, but socially assembled list of brands and goods. This was based around a voting system for popularity.

	Tech
	* Angular 2 App
	* Firebase backend

* [Superjuice.cc Mirror](https://nikodunk.github.io/sustainable-co-videos/)

![](/learnings/superjuice2.png)

---------

### ![](/learnings/logo_superjuice.png)  Superjuice | Kayak for Energy

Price comparison for sustainable energy – The initial version of the above projects (and my first software project!) revolved around price comparison for energy. The US had a solution for apartment renters to go solar easily: You can “virtually” buy energy from renewable farms upstate or out in the ocean. The energy you buy is credited to your electric bill every month. Comparing prices is extremely difficult though. The initial project pitch was this. Superjuice was an energy price search engine that helps apartment owners find the best rates. It does this by indexing all power provider prices in the NY area in real-time. My first online project.

	Tech
	* My first software project
	* Codebase is too mangled

* [No link available]










# Blockchain
--------------------------------------------------------------------------------------------------------------

### Insureum | Insurance with smart contracts – 2nd place Angelhack SF 2018 (Consensys prize)

Ethereum smart contract to make insurance cheaper, easier and less fraud-prone. We built a smart contract that you can pay in to every month, and then vetted hospitals (and only they!) can directly withdraw reimbursements for your treatment from the contract, once they've verified that you've paid up.

	Tech
	* Ethereum Dapp written with Truffle and Infura
	* Frontend in Vanilla Javascript/Web3/Webpack (Truffle)
	* Contract in Solidity, deployed on Rinkeby with Infura

	Stats
	* Coming Soon

* [Insureum Web App](https://insureum.netlify.com) (note: requires [Metamask](http://metamask.io) on desktop or [Toshi](http://toshi.org) on mobile) to view)


![](/learnings/demo insureum.gif)


--------

### Sensorcoin | Google Contacts on the blockchain

From November to January Phil Chacko and I worked on various other projects. All the following require [Metamask](http://metamask.io) on desktop or [Toshi](http://toshi.org) on mobile). 

* <a href="https://nikodunk.github.io/escron">ESCRON</a>
* <a href="https://nikodunk.github.io/sensorcoin/">Sensorcoin</a>
* <a href="https://nikodunk.github.io/contactStorage">Universal Contact Storage</a>
* A landing page suggesting an <a href="https://nikodunk.github.io/coinhold/">Institutional-grade investment tool</a>

So far we haven't been able to find a business case with these Dapps, and as described <a href="https://nikodunk.github.io/blockchain">here</a>, the development of the ecosystem is so fast-paced (read: everything is still unfinished) – most of these projects are already easier to do as when we built them.

![](/learnings/ethereum.png)










# Work
--------------------------------------------------------------------------------------------------------------

### Building a startup accelerator at swissnexSF

![](/accelerator/moneyshot1.jpg)

Next to my learnings described [here](/accelerator), and numerous lessons in marketing, project management, team, networks, et al, I'd like to hold on to one quote from a superior that will stick with me for a while:

	The degree to which you can deploy a digital solution is limited by the network in which you can deploy it.

site:

* https://www.swissnexsf.org/startups

media coverage:

* https://www.startupticker.ch/en/news/february-2018/swiss-startups-join-innosuisse-market-entry-camp-in-san-francisco
* https://www.startupticker.ch/en/news/may-2018/applications-open-for-startup-camp-in-san-francisco
* https://www.startupticker.ch/en/news/june-2018/what-swiss-start-ups-learned-in-san-francisco

writing:

* https://nextrends.swissnexsanfrancisco.org/back-to-the-city/
* https://nikodunk.github.io/accelerator

---------

### Eponym – Business Development and Software Development (work)

Coming soon

---------


### Employment at Herzog & de Meuron

When working professionally, designed facades and interiors mostly for competition work. This facade was designed by the team I was on at a large architecture firm in Basel, Switzerland. We won that competition.


![](/learnings/hillerod.jpg)


-----

### Architecture/Engineering at ETH Zurich


Architecture school project, inspired by Tanizaki’s “In Praise of Shadows”. This project reflected the poetic side of architecture – most of the school was engineering.

![](/learnings/sik.jpg)
![](/learnings/emerson.jpg)



--------


### UX/UI contracting in SF

I learned a huge amount about dealing with clients, together with my friend Zebulon Reynolds in San Francisco. The game was an iOS Flight Simulator.

![](/learnings/infinite.jpg)
![](/learnings/infinite.gif)





# The beginning of time.
--------------------------------------------------------------------------------------------------------------

You made it this far!

---------