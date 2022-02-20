# The Path to Principal
The journeys of current American Ballet Theatre and New York City Ballet principals

## About this project
The prompt for this project was simply something we found interesting and fresh on my mind was the annual ballet competition, Prix de Lausanne. The competition draws in the world’s best students and many competitors are now principal dancers. I collected data on the competition’s prizewinners (and will hopefully return to visualize it in the future), but the broader overarching topic I wanted to look into was the career trajectories of the world’s top dancers.

Inspired by the New York Times’ story ["Paths to Power: How Every Member Got to Congress,"](https://www.nytimes.com/interactive/2019/01/26/opinion/sunday/paths-to-congress.html) I decided to instead collect and visualize the journeys of principal dancers at [American Ballet Theatre](https://www.abt.org/the-company/dancers/) and [New York City Ballet](https://www.nycballet.com/discover/meet-our-dancers/). The data was collected manually from the company’s websites, since it was not available in a table or an otherwise easily parseable format, and was reshaped in Python. I chose these two companies because they are two of the best in the United States and their dancer biographies were fairly comprehensive. I would have liked to include more companies, but inconsistencies and lack of information in other companies’ biography pages made that difficult (for example, one company I looked at detailed where dancers had their early training, but not when).

Still, even just looking at these two companies, I learned how varied paths can be, as some dancers joined other companies before ending up at ABT or NYCB. In other companies I looked at, these paths were even more varied, as dancers took on different positions at numerous different companies before landing at their current position. This variability meant I had to grapple with decisions about what to include and omit. For example, I ended up not counting competitions in this chart, because dancers competed and won at completely different ages. Some competed at 10, others competed at 18 right before joining a company. And many of those dancers also competed in multiple competitions, which would have then added in another factor of deciding which competitions deserved highlighting.

Finally, for visualization, I used ggplot2 in R. All the code and data for this project is available on [GitHub](https://github.com/ilenapeng/stevens-creek).

## Repository contents
* data-reshape.ipynb: Reshaping data
* charts.R: ggplot2 code for creating the charts
* data folder: Data used for final charts - abt.csv and nycb.csv are the paths and abt-points.csv and nycb-points.csv are the highlighted points on the chart
* raw-data folder: Originally collected, unreshaped data