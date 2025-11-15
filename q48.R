#Quantas horas por semana, aproximadamente, você dedica a estudos?

g48 <- df2 |>
  mutate(q48 = case_when(
    q48 %in% c("Nenhuma, apenas trabalho") ~ "0",
    q48 == "Uma a três" ~ "1-3",
    q48 == "Quatro a sete" ~ "4-7", 
    q48 == "Oito a doze" ~ "8-12",
    q48 == "Mais de doze" ~ "12+",
    TRUE ~ q48
  ),
  q48 = factor(q48,
    levels = c("0", "1-3", "4-7", "8-12", "12+"),
    ordered = TRUE)) |>
  tidyplot(x = q48) |>
  add_count_bar() |>
  adjust_x_axis_title("Horas de estudo por semana") |>
  adjust_y_axis_title("Frequência")
