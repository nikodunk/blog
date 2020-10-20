---
layout: post
title:  "How to load intercom in Functional React Component (Hooks) in 2020"
date:   2020-10-20 08:00:00 -0700
tags: ["Learnings", "Updates"]
---

Not sure why there's no good resources online on this, but this is one of these silly plumbing issues that can waste hours. The two [main libraries](https://www.npmjs.com/package/react-intercom) to simplify mounting Intercom into React directly are dead, and [Intercom's SPA](https://www.intercom.com/help/en/articles/170-integrate-intercom-in-a-single-page-app) guide is not super helpful. 

So without further ado – How to load Intercom to a React component (if you don't want to put it in the head of your index.html) in 2020 is as follows:

Load library in [react-helmet](https://github.com/nfl/react-helmet):

{{< highlight javascript "linenos=table" >}}

<Helmet>
    <script>
        {`
        var APP_ID = "your_app_id";
        (function(){var w=window;var ic=w.Intercom;if(typeof ic==="function"){ic('reattach_activator');ic('update',w.intercomSettings);}else{var d=document;var i=function(){i.c(arguments);};i.q=[];i.c=function(args){i.q.push(args);};w.Intercom=i;var l=function(){var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://widget.intercom.io/widget/' + APP_ID;var x=d.getElementsByTagName('script')[0];x.parentNode.insertBefore(s, x);};if(document.readyState==='complete'){l();}else if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();
        `}
    </script>
</Helmet>

{{< / highlight >}}


Then mount the component on window with useEffect.

{{< highlight javascript "linenos=table" >}}

function loadIntercom() {
    if (window.Intercom) {
      window.Intercom('boot', {
        app_id: 'your_app_id',
        //...other info here
      })
    }
    return () => window.Intercom('shutdown')
  }
useEffect(loadIntercom, [])

{{< / highlight >}}

Boom. Done.