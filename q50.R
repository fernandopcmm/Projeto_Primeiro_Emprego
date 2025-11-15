#De forma geral, como se sente em relação ao trabalho oriundo do PPE?

#Para variáveis qualitativas ordinais com esquema de cores
g50 <- df2 |>
  mutate(q50_fator = factor(q50,
    levels = c("Muito satisfeito", "Satisfeito a maior parte do tempo", 
    "Satisfeito somente em alguns momentos", "Insatisfeito"),
    labels = c("Muito satisfeito", "Satisfeito\na maior parte", 
               "Satisfeito\nem alguns momentos", "Insatisfeito"),
    ordered = TRUE)) |>
  tidyplot(x = q50_fator, fill = q50_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Muito satisfeito" = "#006400", 
  "Satisfeito\na maior parte" = "#32CD32", 
  "Satisfeito\nem alguns momentos" = "#FFA500", 
  "Insatisfeito" = "#FF0000")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Grau de satisfação geral") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")



