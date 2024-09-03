---
layout: post
title: "A counterintuitive way to unify your native and web code bases without destroying UX"
date: 2024-08-03 08:00:00 -0700
---

The most native-feeling way we've found to deliver a React web app to mobile without building all screens twice is to do something similar to [Strada](https://hotwire.dev), but with React/React-Native. 

If you're mobile-only, this is not the solution for you (build it in React Native). If you're mobile-first, then build it in React Native and ship it to web. 

But if you're a relatively low-fi app (like a banking app) that has a ton of complex business logic and screens, then this could be a useful way to reduce your code surface. It [worked well for us](https://nikodunk.com/2022-05-10-the-tech-stack-for-maximum-efficiency) at Atmos.

- You ship each web page in its own React Native Webview.

- You put all the webviews on their own screens and wrap them in a "native" React Native navigator to make your top bar, bottom bar, bottom sheets and transitions between these screens all use native animations, stacks and tabs.

- The native navigator can even cache your app's state so that it only needs to be hydrated from the server once (and not on each page navigation). Sending data into the webview: You can then inject the state into every webview over a global window object with ```injectedJavaScriptBeforeContentLoaded={`window.posts = '${JSON.stringify(posts)}'`}```. The webviews/pages are ephemeral and get destroyed after each tap and navigation, so should be save to mount it on window so that React can access it in the webview.

- Getting data back from the webviews: Button taps and presses need to sense whether they're happening on the web (ie. a normal React Router navigation or weblink) or on mobile (in which case they'll call something like `window.ReactNativeWebView.postMessage(JSON.stringify({screen: 'Home', params: {postId: '2dfcx'} }))`. This switch should be wrapped in a re-usable function of course.


This allows us to have one codebase for ios, android and web while staying relatively sane.


------
Note: Doing the inverse of the above and building on expo/react-native first and then shipping it to web with react-native-web is also a great option if your libraries support it (graphing, etc). This closes off server-side rendering to you in most cases, but if you don't require SEO/indexing and have fully gated, dynamic content then this is slightly more elegant as you can keep all your code react-native and react-native-web does the heavy lifting. Bluesky builds their clients this way.