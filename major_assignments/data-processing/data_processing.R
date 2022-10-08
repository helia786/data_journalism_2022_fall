library(tidyverse)

# Read in raw data --------------------------------------------------------

winred_raw <- vroom::vroom(here::here("data-raw", "sb1552533.csv"))

# Identify Trump and his committees ---------------------------------------

# The article identifies "$56 million he and his committees raised online so far
# this year". It does not provide which committees are tied to Trump.

# First, include all committees with Trump in the name.
# Second, include the Save America committees
trump_committees <- c("TRUMP MAKE AMERICA GREAT AGAIN COMMITTEE",
                      "TRUMP VICTORY",
                      "TRUMP-GRAHAM MAJORITY FUND",
                      "SAVE AMERICA",
                      "SAVE AMERICA JOINT FUNDRAISING COMMITTEE")

online_total <- winred_raw |>
  # Only include online fundraising by Trump and his committees
  filter(recipient %in% trump_committees) |>
  # Get the total amount raised
  summarise(sum(amount)) |>
  pull()

