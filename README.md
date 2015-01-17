Waste-Food-Project
==================

This is our final two-week challenge at Makers Academy.  We are aiming to create a web application that will connect individuals with surplus food to those local charities and organisations in need.  This is a [team challenge](#team) drawing on an initial idea from [Claudia Beresford.](https://github.com/Callisto13)


###Team : Weekend To-Do List
This is a temporary element to the README.  By Monday, it would be good if we could have all:
- read-up on the cause
- read this README
- considered some of the naming/branding ideas (I think Alan is working on a mock logo according to an owl called oodles.  Alan, if you want to quickly update the branding section below at all based on the notes we brainstormed, feel free to do so..)
- considered any useful/additional features that we might like to add to our stretch goals
- have any ideas of web-sites that you think could be useful for design inspiration
- not so necessary yet, but does anyone want to take a look at Foundation/Modernizr and look into any interesting accessibility technologies?

####More Notes & Ideas
Depending on our progress, we could invite one or two applicable charities to our end-presentation.  If we integrate Tesco's store list, we can send it to them too.


###The Cause
Here are some links that Claudia found that give further background on the topic:
* [FareShare](http://www.fareshare.org.uk/)
* [FareShare Food Guidelines](http://www.fareshare.org.uk/wp-content/uploads/2014/12/Food-offers-Guidelines-2014-15.pdf)
* [FoodCycle](http://foodcycle.org.uk/)
* [2010-2012 Food Waste Bill](http://services.parliament.uk/bills/2010-12/foodwaste.html)
* [Love Food Hate Waste](http://england.lovefoodhatewaste.com/node/2472)
* [Tesco Food Collection:](http://foodcollection.tesco.com/#donate-in-store)


###Some Killer Stats
FareShare provided 13.2m meals last year and state that over 82,000 people benefit from FareShare food per day.  They believe the beneficiary charities that they serve saved costs of around £13k as a result.  Despite this, they believe that they are currently handling just 1.5% of surplus food available in the UK.  They believe that c800m meals could be provided having assessed food wasted and a proportion that is fit for consumption.


###Minimum Viable Product
An individual consumer who has spare food to donate should be able to visit our site, enter a post-code, and then be presented with a list of local charities that would accept their food.  The applicable charities' locations should be clearly presented and sorted according to their proximity.


###Key Considerations
We want charities to be able to engage with this platform.  We must consider the technology they may use to access our app and hence accessibility will be one of the central challenges of our design.  We will aim to gracefully support IE6.  We think [Modernizr](http://modernizr.com/) may be useful in dynamically checking browser support and hence conditionally including CSS and Javascript features.  We would like our site to present nicely on mobiles, and may choose to design from a mobile-first perspective.  We may choose to employ the responsive functionality that the [Foundation](http://foundation.zurb.com/) framework offers. 

###Stretch Goal Ideas
- [Tesco have a Food Collection Programme](http://foodcollection.tesco.com/#donate-now) that is well-integrated with their nationwide store network.  Provided consumers buy items from those lists copied below, it is "really easy to donate in store" by leaving those products at Tesco's "permanent collection points" in their stores.  The Tesco web-site does not offer an easily-accessible list of stores with collection points, but the [Trussell Trust does](http://www.trusselltrust.org/resources/documents/Store-List-2014-November-National-Tesco-Collection.pdf) and Tesco's CEO Office also provided us with a list of their stores to help us identify stores that qualify.  Generally, these are the Tesco "Extra" & "Superstore" stores.  We think we should be able to integrate this so that consumers could find more convenient locations near to their home or work making it easier for them to donate spare food.
- This site should be easily shared hence we should integrate with Twitter, Facebook, etc.
- Users should be able to register since e-mail marketing could be a useful way of keeping the initiative top-of-mind and updating consumers on progress.
- Could we brand this cause effectively to raise greater awareness of both individual responsibility and the easy practical actions that individuals can take?  Can we add more impressive visual, video, or splash pages that beautifully elaborate on the cause to the most advanced browsers?  i.e. outside the core functionality, can we tell the story more deeply?
- Our system at the outset does not track the actual donations and hence it is hard to proxy the effectiveness of our campaign, the incremental donations it engenders, and incremental foot-fall that Tesco would receive.
- If we could track individual donations more tightly, potentially we could integrate merchandise, rewards, stickers, badges, etc.
- Could our system be designed such that it is more closely integrated into a transportation service such as a Boris-Bike or Uber-type infrastructure?  Could we go further to integrate donors, their donations, the destinations and the prevailing transport network?
- [Crisis](http://www.crisis.org.uk/) on Commercial Street work with FairShare and maintain Daily rather than static menus, partly to reflect some of the diversity in the donations they receive.  This could offer inspiration for a cook-book since it requires them to be consistently inventive in using up whatever produce they have to hand.
- Hotel & Corporate Waste could be another future donor-base to target.


###The Products That Tesco Can Receive

Tesco have over 350 permanent food collection points across many of their stores in the UK, at which consumers can donate food items from a pre-approved list below.  Tesco themselves divert all surplus fresh food from their distribution centres and online grocery centres to FareShare, adding more fresh produce such as chicken, peppers, apples and other fresh fruit and vegetables.  Tesco also top up consumer donations with money and state that their alliance with FareShare has helped provide the equivalent of seven million meals a year of surplus food.  Tesco also run national collections.  November 2014 was their fifth collection and raised 4.7 million meals vs the first in December 2012 which raised 2.4 million meals.

<img src="https://raw.githubusercontent.com/Callisto13/Waste-Food-Project/master/public/images/tesco_fare_share.png">
<p>
<img src="https://raw.githubusercontent.com/Callisto13/Waste-Food-Project/master/public/images/tesco_trussell_trust.png">


###Name, Branding & Promotion Ideas
We like the idea of almost gamifying this topic, or branding through an animal character to engage people of all ages and to help brand.  Meercats have little to do with insurance but are memorable.  Oodles the Owl, Foodles, Share Bear, Town Mouse vs Country Mouse, seemed to be some of the key ideas that grabbed us, with oodles seeming the most catchy.  Alan is working on a mock version of an owl's face embedded within a heart.


###Team Policies
We are aiming to be in around 9, starting the day with a 'stand-up' meeting and taking lunch as a proper break around 12.30.  We are very keen to have a well-tested product and want to follow a test-driven-development process.  We want to celebrate little victories and milestones and have some fun.


[](#team)<a name="team"></a>
###Team Members
- [Claudia Beresford](https://github.com/Callisto13)
- [Alan Bridger](https://github.com/abridger)
- [Izzy Markwick](https://github.com/imarkwick)
- [Ben Hutchinson](https://github.com/benhutchinson)

###Technologies
- TBC.  Possibly Rails/Ruby/Rspec
- Accessibility Considerations
- Showboating Design/Video Page
- Mobile