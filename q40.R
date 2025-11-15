#Somando a sua renda com a renda dos seus familiares 
#que moram com você, quanto é, aproximadamente a renda familiar?

g40 <- df2 |>
  mutate(q40 = case_when(
    q40 %in% c("De 4,5 a 6 salários mínimos", "De 6 a 10 salários mínimos") ~ "4,5+",
    q40 == "Até 1,5 Salários mínimos" ~ "Até 1,5",
    q40 == "Entre 1,5 a 3 salários mínimos" ~ "1,5-3", 
    q40 == "De 3 a 4,5 salários mínimos" ~ "3-4,5",
    TRUE ~ q40
  ),
  q40 = str_remove_all(q40, "salários mínimos|Salários mínimos|salários"),
  q40 = str_trim(q40),
  q40 = factor(q40,
    levels = c("Nenhuma", "Até 1,5", "1,5-3", "3-4,5", "4,5+"),
    ordered = TRUE)) |>
  tidyplot(x = q40) |>
  add_count_bar() |>
  adjust_x_axis_title("Renda familiar") |>
  adjust_y_axis_title("Frequência")
