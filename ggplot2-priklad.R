library(tidyverse)

# načtení dat

gdta_orig <- read_csv(here::here("data-zdroje", "google",
                                 "2020_CZ_Region_Mobility_Report.csv"))

# Příprava vzorové tabulky

gdta <- gdta_orig %>%
  pivot_longer(ends_with("baseline"),
               names_to = "kategorie",
               values_to = "zmena") %>%
  select(sub_region_1, kategorie, zmena, date, country_region) %>%
  mutate(kategorie = str_remove(kategorie,
                                "_percent_change_from_baseline"))

# výběr pro graf

gdta_rij <- filter(gdta, date > "2020-10-01", is.na(sub_region_1))

# graf

ggplot(gdta_rij,
       aes(x = date, y = zmena)) +
  geom_line(aes(colour = kategorie),
            size = .5) +
  facet_wrap(vars(kategorie)) +
  geom_smooth(aes(colour = kategorie)) +
  scale_colour_brewer(palette = "Set1") +
  theme(
    panel.background = element_rect(fill = "grey95"),
    legend.position = "none"
  ) +
  labs(
    title = "Aktivita podle krajů a typu míst",
    x = NULL,
    subtitle = "Změna proti normálnímu stavu",
    y = NULL
  )
