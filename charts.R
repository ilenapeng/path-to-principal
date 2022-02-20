library(tidyverse)
library(extrafont)
library(ggtext)

##### Data
# Load and order axes
df_abt <- read.csv('abt.csv')
df_abt_points <- read.csv('abt-points.csv')

# change order of y-axis
df_abt <- df_abt %>% mutate(variable = fct_relevel(variable, c('Started training', 'Joined a different company',
                                                               'Studied at a prestigious school', 'Studied at ABT JKO school',
                                                               'Promoted to principal at a different company',
                                                               'Joined ABT Studio Company', 'Became an apprentice',
                                                               'Became a corps de ballet member', 'Became a soloist',
                                                               'Became a principal')))
df_nycb <- read.csv('nycb.csv')
df_nycb_points <- read.csv('nycb-points.csv')

# change order of y-axis
df_nycb <- df_nycb %>% mutate(variable = fct_relevel(variable, c('Started training', 'Studied at a prestigious school',
                                                                 "Studied at NYCB's School of American Ballet", 'Joined a different company',
                                                                 'Promoted to principal at a different company', 'Became an apprentice',
                                                                 'Became a corps de ballet member', 'Became a soloist',
                                                                 'Became a principal')))

##### define plot theme
plot_theme <- theme(
  plot.background = element_rect(color="white"),
  text=element_text(family="Baskerville"),
  plot.title=element_markdown(family="Baskerville", face="bold", size=20, lineheight=1.2),
  plot.subtitle=element_text(size=14),
  axis.title=element_blank(),
  axis.text=element_text(color="black", size=12),
  plot.margin=margin(1,1,1,1, "cm"),
  legend.position="none")

##### ABT chart
# static plot
abt_plot <- ggplot() +
  geom_step(data = df_abt, aes(x=value, y=variable, group=name), alpha=0.2, size=2, color="#FF6146", na.rm=TRUE) +
  geom_point(data = df_abt, aes(x=value, y=variable, group=name), alpha=0.3, size=2, color="#FF6146", na.rm=TRUE) +
  geom_point(data = df_abt_points, aes(x=age, y=milestone), color="#FF6146", size=4.5) +
  labs(
  title="Most of <span style='color: #FF6146'>American Ballet Theatre's</span> current principal<br>dancers joined ABT through the studio company",
  subtitle="Ages at which today's ABT principal dancers reached each milestone",
  caption="\nData from American Ballet Theatre\nGraphic by Ilena Peng"
  ) +
  theme_minimal() +
  plot_theme

print(abt_plot)
ggsave("abt-plot-raw.png", plot=abt_plot, width=12, height=8, unit="in")

##### NYCB chart
nycb_plot <- ggplot() +
  geom_step(data = df_nycb, aes(x=value, y=variable, group=name), alpha=0.2, size=2, color="#CB48B7", na.rm=TRUE) +
  geom_point(data = df_nycb, aes(x=value, y=variable, group=name), alpha=0.3, size=2, color="#CB48B7", na.rm=TRUE) +
  geom_point(data = df_nycb_points, aes(x=age, y=milestone), color="#CB48B7", size=4.5) +
  labs(
    title="All but one of <span style='color: #CB48B7'>New York City Ballet's</span> current principal dancers<br>attended the affiliated School of American Ballet",
    subtitle="Ages at which today's NYCB principal dancers reached each milestone",
    caption="\nData from New York City Ballet\nGraphic by Ilena Peng"
  ) +
  theme_minimal() +
  theme(legend.position="none") +
  plot_theme

print(nycb_plot)
ggsave("nycb-plot-raw.png", plot=nycb_plot, width=12, height=8, unit="in")
