library(dplyr)
library(pointblank)

data <- tribble(
  ~date,         ~temperature,
  "2024-05-01",  64.4,
  "2024-05-02",  68.0,
  "2024-05-03",  71.6,
  "2024-05-04",  66.2,
  "2024-05-05",  69.8,
  "2024-05-06",  73.4,
  "2024-05-07",  68.0,
  "2024-05-08",  71.6
)
data <- data |> mutate(date = as.Date(date))

data |>
  col_is_date(date) |>
  col_is_numeric(temperature) |>
  col_vals_not_null(date) |>
  col_vals_between(temperature, 30, 120)
