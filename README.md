[oodls : Waste Food Project](http://www.oodls.io/)
==========================

[![Code Climate](https://codeclimate.com/github/Callisto13/Oodls/badges/gpa.svg)](https://codeclimate.com/github/Callisto13/Oodls)

[![Test Coverage](https://codeclimate.com/github/Callisto13/Oodls/badges/coverage.svg)](https://codeclimate.com/github/Callisto13/Oodls)

This is our final two-week challenge at Makers Academy.  We are aiming to create a web application that will connect individuals with surplus food to those local charities and organisations in need.  This is a [team challenge](#team) drawing on an initial idea from [Claudia Beresford](https://github.com/Callisto13) and is [hosted here on heroku and via the domain oodls.io](http://www.oodls.io)


###The Cause : Resources
Here are some links that Claudia found that give further background on the topic:
* [FareShare](http://www.fareshare.org.uk/)
* [FareShare Food Guidelines](http://www.fareshare.org.uk/wp-content/uploads/2014/12/Food-offers-Guidelines-2014-15.pdf)
* [FoodCycle](http://foodcycle.org.uk/)
* [2015 House of Commons Environment, Food and Rural Affairs Committee Report: Food security: demand, consumption and waste](http://www.publications.parliament.uk/pa/cm201415/cmselect/cmenvfru/703/703.pdf)
* [2010-2012 Food Waste Bill](http://services.parliament.uk/bills/2010-12/foodwaste.html)
* [Love Food Hate Waste](http://england.lovefoodhatewaste.com/node/2472)
* [Tesco Food Collection](http://foodcollection.tesco.com/#donate-in-store)


###The Cause : Some Killer Stats
* Almost 50% of the total amount of food thrown away in the UK comes from our homes.  As consumers, we throw away 7 million tonnes of food and drink from our homes every year in the UK, and more than half of this is food and drink we could have eaten. We throw away more food from our homes than packaging in the UK every year and an area almost the size of Wales would be needed to grow all of the food we throw away each year. (Source: [Love Food Hate Waste](http://england.lovefoodhatewaste.com/node/2472))

* FareShare provided 13.2m meals last year and state that over 82,000 people benefit from FareShare food per day.  They believe the beneficiary charities that they serve saved costs of around £13k as a result.  Despite this, they believe that they are currently handling just 1.5% of surplus food available in the UK.  They believe that c800m meals could be provided having assessed food wasted and a proportion that is fit for consumption.

* Positive Trends: [According to Love Food Hate Waste](http://england.lovefoodhatewaste.com/node/2472)), between 2007 and 2012 avoidable food waste has been reduced by 21%, equivalent to over 1 million tonnes.  [Tesco's national collections](http://foodcollection.tesco.com) have grown in size.  November 2014 was their fifth collection and raised 4.7 million meals vs the first in December 2012 which raised 2.4 million meals.


###Our Minimum Viable Product & Basic User Story
An individual consumer who has spare food to donate should be able to visit our site, enter a post-code, and then be presented with a list of local charities that would accept their food.  The applicable charities' locations should be clearly presented and sorted according to their proximity.  [Some mock graphics illustrating our user story & graphical user interface can be seen here.](https://github.com/Callisto13/Oodls/blob/master/ideas.md#gui--user-story)

###Sites With Similar Functionality

####[Freecycle](https://www.freecycle.org/)
* Users sign up for an account on the site
* Users search for, and join, local groups
* Users make OFFERED or WANTED posts to the group, describing an item and giving their postcode
* Other users reply to the post to request the item, or to offer an item that they have & to arrange collection etc.
* Once an item has been taken, users make another post to the site
* Users receive emails about the posts made on the site - either for every post, or as a digest

####[Freegle](https://ilovefreegle.org/)
* Based on Freecycle
* Users join a local Freegle group
* Users make OFFERED posts to the group, describing an item and providing pictures
* Other users reply to the post to request the item, or to offer an item that they have & to arrange collection etc.
* Once an item has been taken, the user marks their post as TAKEN so that other users no longer request the item

####[Gumtree](http://www.gumtree.com)
* Users can post adverts to the site in pre-defined cataegories, with a location, images or video, and external links
* Adverts can be marked as Urgent, Featured or Spotlight (at an extra cost)
* Users can be contacted via email or phone
* Users can reply to ads by writing messages through the site or phoning (if avaialble)
* Users can search by keyword, category and postcode/location within given distances

###Key Design Considerations
We would like our site to present nicely on mobiles.  The responsive functionality that the [Foundation](http://foundation.zurb.com/) framework offers may be useful.  We want charities to be able to engage with this platform.  We must consider the technology they may use to access our app and hence accessibility will be one of the central challenges of our design.  [Modernizr](http://modernizr.com/) may be useful in dynamically checking browser support and hence conditionally including CSS and Javascript features.

###Name, Branding & Promotion Ideas
We like the idea of almost gamifying this topic, or branding through an animal character to engage people of all ages and to help brand.  Meercats have little to do with insurance but are memorable.  Oodles the Owl, Foodles, Share Bear, Town Mouse vs Country Mouse, seemed to be some of the key ideas that grabbed us, with oodles seeming the most catchy.  [Alan's initial draft logos can be viewed here.](https://github.com/Callisto13/Oodls/blob/master/ideas.md#logo-iterations) 

###Stretch Goal Features & Ideas
- [Tesco have a Food Collection Programme](http://foodcollection.tesco.com/#donate-now) that is well-integrated with their nationwide store network.  Provided consumers offer items from those lists copied below, it is "really easy to donate in store" by leaving those products at Tesco's "permanent collection points" in their stores.  Tesco have confirmed to us that these items need not necessarily have been purchased in Tesco and hence a consumer is currently allowed to donate and deposit any produce or any brand that meets the conditions of the list.  Tesco does not publish an easily-accessible list of those stores that offer the foodbank collection point service on their web-site, but following contacts with Investor Relations and Customer Services, they did provide us with a CSV file populated with appropriate store post-codes.  Those stores aligned to [Trussell Trust are published on the Trussell Trust web-site](http://www.trusselltrust.org/resources/documents/Store-List-2014-November-National-Tesco-Collection.pdf) and Fareshare was also able to provide us with a list off-line.  We think we should be able to integrate this network so that consumers could find convenient locations near to their home or work, making it easier for them to donate spare food.
- We could offer our unique and evolving data-set in the form of a RESTful API. 
- We could allow users to perform more filtered searches, according to opening hours or the types of produce they hold for example.
- The site could be easily shared hence we could integrate with Twitter, Facebook, etc.
- We could integrate pages that quickly outline the cause to help raise greater awareness of both individual responsibility and the easy practical actions that individuals can take.
- We could develop admin functionality allowing admin users to more easily manage the site, quality-control listings, and monitor any abuse of the service.
- We could allow individual donors to register.  Our MVP system does not track actual donations and hence it is hard to proxy the effectiveness of our campaign, the incremental donations it engenders, and incremental foot-fall that Tesco would receive.  If we could track individual donations more tightly, potentially we could integrate merchandise, rewards, stickers, badges, etc.  This would facilitate individual charities to contact those that have donated to them in particular times of need or to simply market their cause.  We could also develop a 'live map' showing donations as and when they occur.
- Could our system be designed such that it is more closely integrated into a transportation service such as a Boris-Bike or Uber-type infrastructure?  Could we go further to integrate donors, their donations, the destinations and the prevailing transport network?
- [Crisis](http://www.crisis.org.uk/) on Commercial Street work with FairShare and maintain Daily rather than static menus, partly to reflect some of the diversity in the donations they receive.  This could offer inspiration for a cook-book since it requires them to be consistently inventive in using up whatever produce they have to hand.  [FoodCycle](http://foodcycle.org.uk/recipes/) have something a little like this on their web-site and even have recipes from celebrity chefs such as Ken Hom.
- Hotel & Corporate Waste could be another future donor-base to target.
- [Love Food Hate Waste have a mobile app](http://england.lovefoodhatewaste.com/content/download-new-love-food-hate-waste-free-app) that has some synnergies with our idea.  This also links to the API idea above.


###The Products That Tesco Can Receive

Tesco have over 350 permanent food collection points across many of their stores in the UK, at which consumers can donate food items (from any brand, including competitor supermarkets) from the pre-approved lists below.  Tesco themselves divert all surplus fresh food from their distribution centres and online grocery centres to FareShare, adding more fresh produce such as chicken, peppers, apples and other fresh fruit and vegetables.  Tesco also top up consumer donations with money and state that their alliance with FareShare has helped provide the equivalent of seven million meals a year of surplus food.  

<img src="https://raw.githubusercontent.com/Callisto13/Oodls/master/public/images/tesco_fare_share.png">
<p>
<img src="https://raw.githubusercontent.com/Callisto13/Oodls/master/public/images/tesco_trussell_trust.png">


### Why Would You Integrate Tesco Into A Charitable Platform?
As supermarket hours can be more consistent and extensive, the network of drop-off points is broad, the immediate beneficiaries are Fareshare and The Trussell Trust, and we have the data on-hand (!), this feature may be sensible to integrate.  It would be of use to those donors who have the will but are simply time poor.  The service could be considered a little analogus to Amazon's locker service and would ensure our platform is immediately populated with over 350 legitimate drop-off points that a donor could visit today.  Over time, there would be nothing stopping us from integrating other commercial entities that partner with foodbanks.  We could even provide a registration facility for this, recognising that many supermarkets determine their relations with local foodbanks at the regional store-level and hence the data-set is just more fragmented when compared with Tesco.  We could allow this facility to be turned on/off should a commercial provider have a change of policy or a donor have a preference to support different institutions.  We could also deploy customised marker icons so that users could clearly identify the type of drop-off points on the map.


###Team Policies
We are aiming to be in around 9.30am, starting the day with a 'stand-up' meeting and taking lunch as a proper break around 12.30.  We are very keen to have a well-tested product and want to follow a test-driven-development process.  We want to celebrate little victories and milestones and have some fun.


[](#team)<a name="team"></a>
###Team Members
- [Claudia Beresford](https://github.com/Callisto13)
- [Alan Bridger](https://github.com/abridger)
- [Izzy Markwick](https://github.com/imarkwick)
- [Ben Hutchinson](https://github.com/benhutchinson)

###Technologies
- Rails, Ruby, Rspec
- Foundation
- Google Maps API & Gmaps.Js
- Adobe Illustrator