---
layout: post
title:  "Learnings from work and play"
date:   2018-05-16 08:00:00 -0700
categories: 
image: /learnings/demo_health2.gif
---

What I've learned so far
------------------------------------------------------------------------------


This is a general blog post on my various schemes so far, and I apologize for their breadth and incoherence. Initially centered around hardware and 3D manufacturing, they grew to revolve around React/React Native (Mobile)/Firebase and Ethereum (Blockchain). The common thread through them all was sustainability (whatever that means).

The projects here are listed roughly in reverse chronological order from newest to oldest.

App Projects
------

<b>Soap Dictate</b>

Soap dictate was built to help Stanford Internal Medicine attending Libo Wang save an hour a day on medical note taking (aka "charting") into their EMR system by offering mobile dictation with templating and a web platform. 

Doctors currently spend around 2 hours a day after their shift is over typing up notes at the ward desktop. We enable them to save at least an hour of this time by quickly dictating their notes into their phone during their shift, and making it very easy to copy-paste their notes into the EMR system once they're done. Save an hour a day for $9.99 a month. Currently piloting with 10 physicians.

	Tech
	* Mobile Frontend in React Native/Redux with RNVoice native library
	* Web Frontend in React at http://soapdictate.com (now removed)
	* Backend in Node/Express/Postgresql backend running on Heroku. 

	Stats
	* Coming Soon

* [App Store](https://itunes.apple.com/us/app/soap-dictate-mobile-ehr-notes/id1384252497)
* [soapdictate.com](http://soapdictate.com)



![](/learnings/demo_health2.gif) ![](/learnings/demo_health2.1.png)


<b>I Am Off!</b>

Together with Libo Wang and initially Steven Pease, we set out to help with the burn-out rate of doctors at Stanford Internal Medicine: This app helps doctors (who have irregular schedules and little free time) work out who's off and up to hang out with a super simple calendaring app. 

	Tech
	* Frontend in React Native/Redux
	* Backend in Node/Express/PostgreSQL

	Stats
	* 250 users at Stanford Medicine, Utah Medical, Harvard Medical, London, Rwanda.
	* 145 WAUs

* [App Store](https://itunes.apple.com/us/app/i-am-off/id1378071021)
* [Google Play](https://play.google.com/store/apps/details?id=com.pokedoc.iamoff) 



![](/learnings/demo_health.gif) ![](/learnings/demo_health.png)

------------------------------------------------

Building a startup accelerator at swissnexSF (work)
------
Next to my learnings described [here](/accelerator), and numerous lessons in marketing, project management, team, networks, et al, I'd like to hold on to one quote from a superior that will stick with me for a while:

	The degree to which you can deploy a digital solution is limited by the network in which you can deploy it.




------------------------------------------------


Blockchain Projects
----------
From November to January Phil Chacko and I worked on various blockchain projects. All the following require [Metamask](http://metamask.io) on desktop or [Toshi](http://toshi.org) on mobile). 

* <a href="https://nikodunk.github.io/escron">ESCRON</a>
* <a href="https://nikodunk.github.io/sensorcoin/">Sensorcoin</a>
* <a href="https://nikodunk.github.io/contactStorage">Universal Contact Storage</a>
* A landing page suggesting an <a href="https://nikodunk.github.io/coinhold/">Institutional-grade investment tool</a>

So far we haven't been able to find a business case with these Dapps, and as described <a href="https://nikodunk.github.io/blockchain">here</a>, the development of the ecosystem is so fast-paced (read: everything is still unfinished) – most of these projects are already easier to do as when we built them.

![](/learnings/ethereum.png)

------------------------------------------------

Hardware/Web projects (Solar + Software)
---
With Zebulon Reynolds (for part of the way), this project <a href="http://sunboxlabs.com" target="_blank">sunboxlabs.com</a> developed out of a <a href="https://hackernoon.com/200-for-a-green-diy-self-sufficient-bedroom-that-your-landlord-wont-hate-b3b4cdcfb4f4">HackerNoon</a> post from a hacked together project, implemented between jobs, where it garnered 200'000 views and was featured on <a href="https://news.ycombinator.com/item?id=15216650" target="_blank">HackerNews</a> (<a href="https://news.ycombinator.com/item?id=15216650" target="_blank">twice</a>!) and /r/geek. The project was trying to solve the same as the Solar/Battery Hardware project below (the problem of solar in cities), but this time I took a content/software-only approach. No hardware overhead! <a href="http://nikodunk.github.io/sunboxlabs">sunbox labs</a> was a Jekyll site with React components that helps hackers build their own personal power plants with components off Amazon. Also on this blog at <i><a href="/solar">$200 Solar Self-Sufficiency – without your landlord noticing</a></i>.

<b>Stats</b>: 

* 300 visitors avg / day
* Amazon Affiliate 


![](/learnings/sunboxlabssite.png)

![](/learnings/demo3.png)

![](/200/COMPONENTS.jpg)


From the CNC milled furniture below we started playing around with added electrical components to differentiate it.


![](/learnings/juice.jpg)   
![](/learnings/juice2.jpg)


Eventually we dropped the table and went on with a pure window-sill design. We also built in an Arduino so we could track electrical production during the day. 


> Juicebar concept was an energy generation device that helps urbanites be energy independent without a rooftop by fitting solar+storage on your windowsill.

Many Alibaba-sourced 12V lithium batteries & panels were thrashed at this stage. I also got sucked up in the IoT craze (since this was technically an IoT product), and spent a lot of time pitching and filming, instead of improving the product. This was my first project where coding was involved, so I’m thankful for that.

![](/learnings/juicebar.jpg) 

![](/learnings/juicebar.png)

The pitch was that as an increasing part of the world’s population lives in dense cities, solar rooftops, which are designed primarily for suburbs, become hard to install. Renting an apartment means you mostly don’t have access to the roof. What you do have power over is your own windowsill. This was inspired by Rob Rhineharts blog-post <a href="https://arstechnica.com/gadgets/2015/08/op-ed-how-i-gave-up-alternating-current/" target="_blank">“How I gave up alternating current”</a>. The project turned into solar for apartment-owners so they could charge their devices off a dedicated DC battery, and create their own energy. 

Customers objected that the device was too expensive vs. what money they could save. They also objected that the embodied energy was so high, it would take years to pay off and be “greener” than before. Finally, they objected that the IoT features were useless.




------------------------------------------------
<br><br><br><br><br>



Web projects
---

<a href="https://nikodunk.github.io/focuswriter-react-vr">Focuswriter</a>  – VR productivity app for distraction-free writing, written in reactVR. Look around and type away as the text wraps itself around you. Be sure to click on the moon above your head to switch to GALAXYMODE.

<img style="border: 1px lightgrey solid; max-height: 400px; margin: 0 auto" src="/learnings/demo2.gif"><br><br><br><br>


<a href="https://nikodunk.github.io/simple-to-do-react">CollaborativeToDo</a> – React & Firebase to-do list app w/ full Drag n drop, CRUD. This was chiefly to solve a to-do list excel and email overload we were all suffering from at the office, and let these lists be easily shared and collaborated on between team members.

<img style="border: 1px lightgrey solid; max-height: 400px; margin: 0 auto" src="/learnings/demo.gif"><br><br><br><br>


<a href="https://github.com/nikodunk/solar-search-swift">Solar Summon</a> – Solar search for iOS drawing from MapKit, and <a href="https://github.com/nikodunk/reactnativesolar">Solar Summon</a> – Later Rebuilt in React Native. These were my first iOS projects in Swift and React Native.

<img style="border: 1px lightgrey solid; max-height: 400px; margin: 0 auto" src="/learnings/demo4.gif"><br><br><br><br>

Earlier, more monetizable experiments included the following: 

Software to help you compare prices on certified green products ("is chaos in the green certification market a customer problem?") and cosmetics ("is green certification chaos of cosmetics a customer problem?"). Neither were problems. Eventually this project morphed into an Angular price comparison engine, drawing pricing & image data from Viglink API before it died.

> Price comparison for sustainable goods. Utilising scraped APIfier data and price information from the Viglink API, a price comparison engine for green cleaning products focused on families. It does this by indexing 2101 pre-vetted companies from various labels and certification sites and comparing their products with prices from the Viglink API. <a href="https://nikodunk.github.io/bamazon/">Certified Label Amazon Search</a> and later <a href="https://nikodunk.github.io/ewg-search/">EWG Database Amazon Search</a> – Angular2 product comparison engines for sustainable products, drawing pricing & image data from Viglink API.

![](/learnings/bamazon.gif)  |  ![](/learnings/goodgood.gif)
:-------------------------------------:|:----------------------------------:
				       |
				       


<a href="https://nikodunk.github.io/sustainable-co-videos/">CleanCo Video Product Hunt</a> – Before that, another version of the project involved being a "product hunt" for the videos of certified green companies. This was based around a voting system for popularity.

![](/learnings/superjuice2.png)

Kayak for Energy – The initial version of this project revolved around price comparison for energy. The US had a solution for apartment renters to go solar easily: You can "virtually" buy energy from renewable farms upstate or out in the ocean. The energy you buy is credited to your electric bill every month. Comparing prices is extremely difficult though. The initial project pitch was this.
> Superjuice is an energy price search engine that helps apartment owners find the best rates. It does this by indexing all power provider prices in the NY area in real-time. My first online project.
[no image available]

------------------------------------------------
<br><br><br><br><br>

Eponym
------
Coming soon

Software / BD

------------------------------------------------
<br><br><br><br><br>


Sending flatpack furniture through the mail – my first company
---

> Furniture that’s made of paper. Paper Inc. a furniture company that helps urbanites buy furniture with the push of a button. It then mails you a folded "room in a box" that's easy to set up and you can simply recycle or send back when you move.

My next project was born out of the frustration with the extremely expensive 5-axis process of milling the Lunch dining chair. It went to the other extreme. If wood is too expensive, and consumers like me balk at buying expensive furniture when we move every year in our twenties – could I make something more affordable that can simply be recycled the next time I move? I started with the business plan first. The business plan was simple: Connect all the beautiful cardboard furniture designs out there on the internet with manufacturers in Switzerland, and send them directly to the customer. I was specifically trying NOT to design a product, but to design a service this time round. The business plan won a cash prize at the Innovate4Climate 2014 investment, and pushed me and my co-founder, Benjamin Blum, into one of Zurich’s best clean-tech incubators. This was a differentiated product with a clear path.

![](/learnings/paper.png)

We ended up pivoting to cnc-milled wood before we started out of fear that people wouldn’t want cardboard furniture. Maybe in retrospect thereby torpedo-ing our differentiation. This also pushed us up over the impulse-buy territory we’d previously occupied, and reduced the furniture’s lightweight mail-order nature. We renamed the project Smoke at the same time and offered all-in-one kits. <a href="http://nikodunk.github.io/smoke/">The Website</a>.

<img style="max-height: 400px; margin: 0 auto" src="/learnings/smokesite.png"><br>

We raised some pre-seed capital from Swiss Venture days 2015, but looking back we should have stayed with the original, clear concept.


![](/learnings/smoke.gif)  

 ![](/learnings/smoke.jpg)
 
------------------------------------------------
<br><br><br><br><br>



A CNC-carved chair project
---

LUNCH, a digitally carved dining chair. Made on a 5-axis CNC in portugal, only 20 were ever made. Very expensive. I learned that making your own goods is a whole different operation from selling them.

![](/learnings/lunch.jpg)



![](/learnings/lunch.gif)	     |  ![](/learnings/lunch2.jpg)
:---------------------------------------:|:-------------------------:
								   	     |

![](/learnings/lunch3.png)

Student project, Thomas Meyer and I put in many man-hours into the leather-, copper- and woodwork necessary for this project.

![](/learnings/loungeforceone.jpg)   |  ![](/learnings/loungeforcetwo.jpg)
:------------------------------------------:|:-------------------------:
										    |


------------------------------------------------
<br><br><br><br><br>



UX/UI contracting in SF
---

I learned a huge amount about dealing with clients, together with my friend Zebulon Reynolds in San Francisco. The game was an ios Flight Simulator.

![](/learnings/infinite.jpg)	     |  ![](/learnings/infinite.gif)
:---------------------------------------:|:-------------------------:
								   	     |


------------------------------------------------
<br><br><br><br><br>

Architecture/Engineering at ETH Zurich & employment at Herzog & de Meuron
---
Architecture school project, inspired by Tanizaki's "In Praise of Shadows". This project reflected the poetic side of architecture – most of the school was engineering.

![](/learnings/sik.jpg)

When working professionally, designed facades and interiors mostly for competition work. This facade was designed by the team I was on at a large architecture firm in Basel, Switzerland. We won that competition.

![](/learnings/hillerod.jpg)


![](/learnings/emerson.jpg)

