---
title: outline
---

Outline / Timeline

# 

## Blok 1: 120 min

### Část 1: motivace a úvod do R: 55 min

- kolečko: kdo jsem a jak pracuji s daty? (10 min)
- motivace pro dnešek (prezentace + screenshare)
  - cíle: prezentace (2 minuty)
  - kam se dobereme (ukázat produkt, 2 minuty)
  - jak se tam dobereme (outline)
  - koncept datové analýzy (tidy data diagram)
- motivace k reprodukovatelnému výzkumu
  - prezentace repre + R (5 min):
    - když to je blbě: Excel recession; Excel Covid UK (Excel Covid CZ)
    - když to je dobře: UK stats
    - co s tím všechno jde: BBC, World Bank, evaluace, Economist volební model
  - prezentace R a okolí (5 minut)
    - proč open source
    - kód a data
    - Python a R
- úvod do R a RStudia
  - prezentace (20 min) + nechat je si to otevřít a zkoušet (10 min)
    - RStudio: 
      - setup: download and load .zip
      - panes
        - A: otevřít RStudio
        - console pane:
          A: napsat něco do konzole (ditto)
        - A: files pane: projekt => cesty k souborům
          - A: otevřít vzorový R soubor
          - P: hint na organizaci projektu
        - script pane: 
          - A: otevřít nový R soubor
          - A: napsat něco do skriptu (aritmetický výpočet)
        - A: packages pane:
          - R a balíky => telefon a aplikace
      - klávesové zkratky, autocomplete, nápověda
        - autocomplete
        - na ledacos existují zkratky
        - zatím pár základních: 
          - ctrl + Enter
          - ctrl + shift + Enter
          - ctr + M
          - Tab + nahoru/dolů
    - R (prezentace + vzorový R soubor + zkoušejí do něj psát)
      - kód: nic jiného není (kód a data) - počítač dělá, co mu řeknete
        - pokud vidíte chybu, problém je buď v tom, že jste to špatně napsali, 
        nebo v tom, že jste počítači řekli něco jiného, než co si myslíte, že jste mu řekli
          - chyba / varování / zpráva
      - prostředí, objekty => stůl a věci na něm
      - funkce
      - základní datové typy
      - missing values
      - logické operátory
  - aktivity (bez ničeho, oni sami v prázdném okně - 10 min)
    - zapsat objekt různého typu
    - zavolat funkci (třeba průměr)
    - vyplotovat data (třeba dvě řady čísel)

### Část 2: Začít projekt + zvládnout tidy data, tidyverse a pochopit rmarkdown

- ukázat konečný výstup (word)
  - jak jsme se k němu dostali
    - dva kroky / změny => proces datové analýzy
      - s jakými daty pracujeme a jakými nástroji: tabulková data (data frame) + tidyverse
      - spojení kódu, textu a export do výstupu
  
- RMarkdown - představit na minimalistickém příkladu
  - kód a text = rmakdown => export do formátu
  - header (+ nastavení v menu)
  - code chunks
  - inline code

- představení výstupu
  - otevřít Rmd + Knit
- představení workflow
  - projít Rmd po částech

- Organizace projektu
  - reprodukovatelnost
  - postup datové analýzy

- tidyverse
- tidy data: ~ databázová normalizace
  - definice
  - v prezentaci příklady netidy, nechat je hádat
- ve skutečnosti nás budou zajímat tabulky - data frame / tibble
- dplyr
  - filter
  - select
  - mutate
  - summarise (count)
  - join

- ggplot2

## Blok 2

### Část 3: aplikovaná analýza dat, začátek vizualizace

### Část 4: vizualizace dat, přehled dalších témat a možností

- příležitosti a motivace
  - diskuse: kde vidíte příležitost? Kde to použijete? (15 minut)
