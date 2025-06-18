---
layout: post
title: "Network resilience vs. grid resilience"
date: 2025-06-17 08:00:00 -0700
categories:
---

![](/assets/internet-resilience-vs-energy-independence.jpg)


At Pila, our immediate mission is to bring 21st-century energy resilience to every household and retire the gas generator for good. Distributing batteries throughout buildings for modern energy security is the first step. But as the grid breaks into a billion of these intelligent, independent systems, Pila’s far more ambitious goal is also to help define the systems and protocols to ensure they all work together. That means enabling batteries in homes, businesses, and communities to automatically work together as one seamless whole. Through auto-meshing and embedded local intelligence, we can turn individual appliances into an ultra-resilient, distributed energy network.

**The status quo**

The U.S. electric grid, as it stands today, runs largely on old-school communication networks \- and in some ways, that’s a blessing in disguise. While intelligence and connectivity can unlock enormous potential, they also come with trade-offs: Too often, they introduce brittle complexity. “Smart” yet inflexible hardware often ages quickly. And they can introduce new forms of risk from software vulnerabilities and excessive dependency on internet access to exposure to unstable supply chains. We’ve already seen how this can go wrong \-  when [Enel X deprecated the software](https://www.canarymedia.com/articles/ev-charging/enel-x-way-abandoned-its-us-ev-charging-customers-what-happens-next) that kept JuiceBox EV chargers running, they left 25,000 of commercial users suddenly unsupported.

In the world of energy, those kinds of failures are more than inconvenient \- they’re downright dangerous. When a smart speaker fails, [the music stops](https://arstechnica.com/gadgets/2024/08/app-redesign-blowback-will-cost-sonos-up-to-30-million-ceo-says/). But when a smart grid component fails, people lose power. Resilience isn’t optional. And yet, too much of today’s “smart” infrastructure depends on [unnecessary cloud servers](https://www.jeffgeerling.com/blog/2025/i-wont-connect-my-dishwasher-your-stupid-cloud), [mobile apps](https://arstechnica.com/gadgets/2024/12/nightmare-zipcar-outage-is-a-warning-against-complete-app-dependency/), [vendor APIs](https://arstechnica.com/gadgets/2024/12/startup-will-brick-800-emotional-support-robot-for-kids-without-refunds/), or [firmware updates](https://arstechnica.com/gadgets/2025/04/google-ending-support-for-older-nest-thermostats-will-stop-selling-nests-in-europe/) to [function](https://arstechnica.com/gaming/2024/11/firmware-hacks-are-rejuvenating-spotifys-car-thing-before-the-company-bricks-it/) [properly](https://arstechnica.com/gadgets/2024/02/leap-year-glitch-broke-self-pay-pumps-across-new-zealand-for-over-10-hours/). That’s not good enough.

**Where we need to go**

*We believe the intelligence layer should be just as resilient as the physical grid itself**.*** It can’t be the weakest link. Some consumer products that have paved the way for our vision include [Ollama](https://ollama.com/), [Home Assistant](https://www.home-assistant.io/), [Trmnl](https://www.youtube.com/watch?app=desktop&v=eIcZZX10pa4), [Shelly](https://us.shelly.com/), and the [Powerwall](https://www.tesla.com/support/energy/solar-inverter/connecting-to-tesla-solar-inverter) and the [original Nest](https://www.youtube.com/watch?v=HhqD-ljcD6I) (before Google made Home app obligatory). These products can function without the internet and “official apps” from the app store. 

At Pila, we’re building infrastructure-grade, local-first intelligence that runs at the edge, continues working when cloud services go down, and doesn’t rely on remote updates to stay useful. On-device processing and local networking \- paired with optional local APIs, Home Assistant integration, and more \- ensure your microgrid keeps running at full functionality, no matter what happens. The energy system must remain [anti-fragile](https://pilledtexts.com/why-i-use-a-17-year-old-thinkpad/). Of course there’s a tremendous amount of value added with an internet connection \- from real-time power price signals to weather data to convenient remote control from your smartphone. But this value can exist as an optional benefit atop the core functionality, not a mission-critical failure point. 

If AI becomes embedded into everything, it too should work local-first and not require a cloud. We believe it belongs on the edge \- close to the energy assets themselves, designed to operate and coordinate autonomously, and built to outlast the hardware it runs on. The future grid won’t rely on fragile, centralized control. It will emerge from billions of resilient, intelligent systems at the edge.

Originally posted [here](https://pilaenergy.com/blog/network-vs-energy-resilience)
