EViews_Refresh_Equations_Forecasts
==================================

A modification of the standard EViews refresh equation plugin to refresh forecasted series

==================================

First commit is the original Refresh equations plugin.
The second commit shows what I changed in order to refresh forecasted series

==================================

One of IHS' larger clients has been using an old command line based econometric platform (EPS) created by a predecessor company of IHS for years beyond its expiration date due to a combination of their resistance to change and our desire to not rock the boat. 

When I took over the management of their support, things began to come to a head. Our corporate team wanted to shut down the EPS infrastructure and were tired of dealing with what they saw as an entitled client. The client was claiming we weren’t providing him with the support they needed. So, I needed to rework their old routines in a new platform, try to translate the experience into the more modern dynamic interface that EViews has, and act as a shuttle diplomat between an angry client and product management team.

The first step was to simply translate the routine into an EViews program, to prove that it would work in the exact way the client wanted, and providing an easy to use reference that would help with the translation of future EPS files 

Once this proof of concept was done, I could begin working to get the client thinking about the true dynamic nature of EViews. Unfortunately, the product was not yet capable of such a dynamic setup.

We have an addin that provides a dynamic link to our databases, and an addin that is able to refresh econometric equations, but the forecasted series created from these econometric equations has no dynamic link to the equation.

Knowing that the client wouldn’t accept a simple no in regards to this sort of updating, I updated the equation refresh addin to at least have some rudimentary forecasting updates.

Baring a programmatic link, this was the best solution for the client. It’s usable in this particular case, and will hopefully prompt development of more sophisticated linkages.
