# install.packages("tidyverse")

# Základní matematické operace --------------------------------------------

3 * 4

3 / 4

4 ^ 2

4 ^ 2 * 2

# Funkce ------------------------------------------------------------------

print("hello")

sqrt(16)

# Proměnné a datové typy --------------------------------------------------

x <- 3

y <- 4

z <- "text z" # text v uvozovkách = datový typ 'character' (text)

a <- "12" # i cislo v uvozovkách je text

rada <- 1:3 # x:y vytvoří řadu od x do y; proměnná obsahuje 3 prvky

sada <- c(1, 4) # c() vytvoří proměnnou s více prvky

pismena <- c("a", "b", "c") # proměnná se třemi textovými prvky

mismas <- c(1, "x", 4)

mismas


# Funkce a proměnné -------------------------------------------------------

sqrt(x)

sqrt(rada)

sqrt(sada)

# Operace s vícečlennými proměnnými ---------------------------------------

rada + 1

rada * 3

mismas * 3

min(rada)
max(sada)

# Logické operace ---------------------------------------------------------

4 == 3 + 2

x < 0

x == 3

x <= 3

x != 3

x == y

sada > 2

"c" %in% pismena

"z" %in% pismena

# Patří do množiny? -------------------------------------------------------

3 %in% 1:2

3 %in% c(1, 5)

3 %in% rada

4 %in% sada

x %in% rada

x %in% sada

sada %in% rada

"3" * rada

# Chybějící / neplatné hodnoty --------------------------------------------

30/0

0/0

30 + NaN

30 + NA

30 + Inf

nic <- NA
skoro_nic <- "NA"

is.na(nic)
is.na(skoro_nic)

# Počítání s proměnnými ---------------------------------------------------

x * y

x * a

# Logické operace s proměnnými --------------------------------------------

ano <- TRUE

ne <- FALSE

1 == ano

any(c(ano, ne))
all(c(ano, ne))

any(c(ano, ne))
all(c(ano, ne))

# Funkce z balíků ---------------------------------------------------------

# instalace:

install.packages("stringr")

library(stringr)

str_split(z, " ") # parametry podle pořadí
str_split(string = z, pattern = " ") # parametry podle názvu

tidyverse_packages()
