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

# řetězení operací ----

gdta %>%
  select(-country_region) %>%
  rename(kraj_nazev = sub_region_1) %>%
  filter(date > "2020-10-01") %>%
  mutate(zmena_dec = zmena/100) %>%
  select(-zmena) %>%  #BREAK
  group_by(kraj_nazev, kategorie) %>%
  mutate(zmena_min = min(zmena_dec, na.rm = T),
         zmena_max = max(zmena_dec, na.rm = T)) %>%
  summarise(zmena_p = mean(zmena_dec, na.rm = T)) %>%
  ungroup() %>%
  arrange(kategorie, zmena_p) %>%
  arrange(kategorie, desc(zmena_p)) %>%
  filter(kategorie == "workplaces") %>%
  replace_na(list(kraj_nazev = "Celá ČR"))


# Pipe %>% ----------------------------------------------------------------

# slovesa bez pipe

summarise(
  filter(
    select(gdta, date, zmena),
    date > "2020-10-01"),
  min_zmena = min(zmena, na.rm = T))

# s pipe

gdta %>%
  select(date, zmena) %>%
  filter(date > "2020-10-01") %>%
  summarise(min_zmena = min(zmena, na.rm = T))


# Base x tidyverse --------------------------------------------------------

# ukázka base R

x <- gdta[gdta$zmena < -45,]
x <- x[,c("kategorie", "zmena")]
x

# totéž v tidyverse

gdta %>%
  filter(zmena < -45) %>%
  select(kategorie, zmena)

# široká a dlouhá data ----

# příprava

gdt_messy <- gdta_orig %>%
  select(date, sub_region_1,
         transit = transit_stations_percent_change_from_baseline,
         retail = retail_and_recreation_percent_change_from_baseline) %>%
  mutate(across(c(transit, retail), ~paste(.x, "pct"))) %>%
  group_by(sub_region_1) %>%
  slice(2)

# úprava na tidy

gdt_messy %>%
  pivot_longer(c(transit, retail),
               names_to = "kategorie",
               values_to = "zmena") %>%
  separate(zmena, into = c("zmena", "jednotka")) %>%
  mutate(zmena = as.numeric(zmena)) %>%
  head(5) %>% kable(format = "html")
