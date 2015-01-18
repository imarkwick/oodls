Quick Findings On Browser Compatibility
=======================================

We are keen to ensure our project is accessible.  This will involve supporting some older browsers and providing either progressive enhancements and graceful degradations where appropriate within our design.  This page follows some quick research on IE6.

###Statistics
[According to Microsoft's modern.ie](https://www.modern.ie/en-us/ie6countdown), as of Jan 2015, IE6 is being used by just <=1% users in most countries. Exceptions are China (2.3%) and Venezuela (1.2%).

###Ideas For Testing
* [The Internet Explorer web-site allows you to install local virtual machines](https://www.modern.ie/en-us/virtualization-tools#downloads) which appear to be able to emulate different browser and machine configurations.  This would allow us to test our site on old versions of IE and in old OS environments.
* [BrowserStack](http://www.browserstack.com/test-in-internet-explorer) appears to have very quick, easy, and cross-IE testing environments for v6, 7, 8, 9, 10 and 11 in different OS environments.  Mobile and other browser testing is also possible though sadly this is not free beyond a 30 minute trial.
* [Can I Use](http://caniuse.com/#info_about) may help us in the testing phase, no matter what type of browsers we aim to cater for.


###Some Of The Key Differences In Older IE
[Microsoft have an article on CSS Compatibility & Internet Explorer.](http://msdn.microsoft.com/en-us/library/cc351024(VS.85).aspx)  "Internet Explorer 6 was the first fully CSS, Level 1-compliant version of Internet Explorer. Internet Explorer 8 is fully compliant with the CSS 2.1 specification and supports some features of CSS3. That page along with [caniuse.com](http://www.caniuse.com) are useful in detailing what IE supports.  "Developers often have to resort to strategies such as CSS hacks, conditional comments, or other forms of browser sniffing to make their websites work in IE6."


###A Commercial Take On Browser Support
Our guiding principle will be our client.  Nevertheless and for interest, [Smashing Magazine offered a philosophical view on browser support issues.](http://www.smashingmagazine.com/2011/11/03/but-the-client-wants-ie-6-support/)  "Supporting a browser is not black and white, either no support or full support. How good your fallbacks need to be will greatly determine how much extra time you have to spend on them....Even if they are not willing to pay for mobile support, my responsibility as a Web developer is to at least add some media queries and make it decent there. Even if they don’t care about accessibility, my responsibility is to make the website somewhat accessible. These things don’t take up much time anyway, and they should be factored into even your lowest price....in cases of really naughty browsers, like IE 6 and 7, sometimes even graceful degradation doesn’t work very well. Then, what I usually do is split my CSS into three files...and I just don’t serve screen.css to IE 7 and below.  All of those require minimal effort on your part."


###Resources
* [CSS Tricks state](http://css-tricks.com/how-to-create-an-ie-only-stylesheet/) that "the tool of choice for fighting IE problems is the conditional stylesheet."  They recommend serving IE 6 and below a special stripped-down stylesheet, and then serve IE 7 and above (and all other browsers) regular CSS. This is been coined "the universal IE 6 CSS.""

```html

Target IE 7 ONLY

<!--[if IE 7]>
  <link rel="stylesheet" type="text/css" href="ie7.css">
<![endif]-->

Target IE 6 ONLY

<!--[if IE 6]>
  <link rel="stylesheet" type="text/css" href="ie6.css" />
<![endif]-->

```

* [Modenizr](http://modernizr.com/) is a JavaScript library that detects HTML5 and CSS3 features in the user’s browser.  "Modernizr makes it easy for you to write conditional JavaScript and CSS to handle each situation, whether a browser supports a feature or not. It’s perfect for doing progressive enhancement easily."

* [Selectivizr](http://selectivizr.com/) is a JavaScript utility that emulates CSS3 pseudo-classes and attribute selectors in Internet Explorer 6-8. Simply include the script in your pages and selectivizr will do the rest.

* [CSS Pie](http://css3pie.com/documentation/product-comparison/) offers a comparison of a number of IE6/7 Javascript-based libraries that aim to proxy-enhance CSS support.  These include ie7.js which focuses on layout bugs and advanced selectors, css3pie which makes Internet Explorer 6-9 capable of rendering several of the most useful CSS3 decoration features such as border-radius, Selectivzr, eCSStender with extensions including @font-face, CSS3 selectors, and CSS3 Backgrounds and Borders, and a few others.







