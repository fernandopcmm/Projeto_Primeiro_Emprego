#Quantas pessoas, da sua família, moram com você na mesma casa?
g39 <- df2 |>
  mutate(q39 = case_when(
    q39 %in% c("Seis", "Mais de Seis") ~ "6+",
    q39 == "Nenhuma" ~ "0",
    TRUE ~ q39),
  q39 = factor(q39, 
    levels = c("0", "Uma", "Duas", "Três", "Quatro", "Cinco", "6+"),
    ordered = TRUE)) |>
  tidyplot(x = q39) |>
  add_count_bar() |>
  adjust_x_axis_title("Categoria") |>
  adjust_y_axis_title("Frequência")