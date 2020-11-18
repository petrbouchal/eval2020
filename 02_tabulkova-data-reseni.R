library(tidyverse)
library(skimr)

# Úkol 0: stáhnout a načíst data ------------------------------------------

tf <- tempfile(fileext = ".zip")
download.file("https://www.gstatic.com/covid19/mobility/Region_Mobility_Report_CSVs.zip",
              destfile = tf)
unzip(tf, exdir = "data-zdroje/google/")

googledata <- read_csv("data-zdroje/google/2020_CZ_Region_Mobility_Report.csv")

# Úkol 1: podívat se na souhrn dat ----------------------------------------

glimpse(googledata)
skimr::skim(googledata)

# Úkol 2: přejmenovat sloupce a vyřadit ty zbytečné ------------------------

gd <- googledata %>%
  select(-sub_region_2, -metro_area, -census_fips_code,
         -country_region, -country_region_code) %>%
  rename(kraj_nazev = sub_region_1,
         kraj_kod_iso = iso_3166_2_code) %>%
  replace_na(replace = list(kraj_nazev = "Celá ČR"))

glimpse(gd)
skimr::skim(gd)
rm(googledata)

# Úkol 3: Ve kterých dnech bylo v jednotlivých krajích nejméně lidí v obchodech? ----

min_obchod <- gd %>%
  filter(date > "2020-09-01" & date != "2020-10-28") %>%
  rename(obchod = retail_and_recreation_percent_change_from_baseline) %>%
  group_by(kraj_nazev) %>%
  filter(obchod < -50) %>%
  select(date, kraj_nazev, obchod) %>%
  ungroup() %>%
  arrange(obchod)

min_obchod

# Úkol 4: průměrné poklesy po krajích v říjnu -----------------------------

gd_dlouhe <- gd %>%
  pivot_longer(cols = ends_with("baseline"),
               values_to = "zmena",
               names_to = "kategorie") %>%
  mutate(kategorie = str_remove(kategorie, "_percent_change_from_baseline")) %>%
  mutate(kategorie_cz =
           recode(kategorie,
                  retail_and_recreation = "Obchody a rekreace",
                  grocery_and_pharmacy = "Potraviny a lékárny",
                  parks = "Parky",
                  transit_stations = "Stanice veř. dopravy",
                  workplaces = "Pracoviště",
                  residential = "Obydlí"))

distinct(gd_dlouhe, kategorie)
distinct(gd_dlouhe, kategorie_cz)

gd_dlouhe

prumery <- gd_dlouhe %>%
  filter(date > "2020-10-01") %>%
  mutate(kraj_nazev = fct_reorder(kraj_nazev, -zmena, mean, na.rm = T)) %>%
  group_by(kraj_nazev, kategorie_cz) %>%
  summarise(prumer = mean(zmena, na.rm = T))

prumery

# Úkol 5: zobrazit předchozí výsledek -------------------------------------

ggplot(prumery, aes(y = kraj_nazev, x = prumer)) +
  geom_col() +
  facet_wrap(facets = vars(kategorie_cz)) +
  labs(title = "Průměrné poklesy mobility v říjnu 2020",
       subtitle = "podle krajů a kategorií lokality",
       caption = "Zdroj: data Google Mobility")

# Úkol 6: přejmenovat kategorie do češtiny --------------------------------

# viz výše

# Úkol 7: zobrazit vývoj za ČR v jednotlivých kategoriích -----------------

gd_dlouhe_cr <- gd_dlouhe %>%
  filter(kraj_nazev == "Celá ČR")

ggplot(gd_dlouhe, aes(x = date, y = zmena, colour = kategorie_cz)) +
  # geom_line(aes(x = date, y = zmena, colour = kategorie_cz)) +
  facet_wrap(facets = vars(kategorie_cz)) +
  geom_smooth(method = "loess") +
  geom_hline(yintercept = 0)


# Úkol 8: přidat české kódy a názvy krajů ---------------------------------

kraje_cesky <- read_csv("data-zdroje/prevodnik-kraju.csv", col_types = cols(.default = "c"))
kraje_cesky <- kraje_cesky %>%
  rename(kraj_nazev_cz = kraj_nazev)

gd_dlouhe_cesky <- gd_dlouhe %>%
  left_join(kraje_cesky,
            by = c(kraj_kod_iso = "iso_3166_2_code"))

glimpse(gd_dlouhe_cesky %>% filter(!is.na(kraj_kod_iso)))
