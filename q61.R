# Como você se sente em relação ao mercado de trabalho comparado a antes do PPE?

g61 <- df2 |>
  mutate(q61_fator = factor(q61,
    levels = c("Menos confiante", "Confiança e preparo não tiveram alteração", 
    "Mais confiante e com preparo similar", "Mais confiante e melhor preparado"),
    labels = c("Menos\nconfiante", "Sem\nalteração", 
    "Mais confiante\npreparo similar", "Mais confiante\nmelhor preparado"),
    ordered = TRUE)) |>
  tidyplot(x = q61_fator, fill = q61_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Menos\nconfiante" = "#FF0000", 
  "Sem\nalteração" = "#FFA500", 
  "Mais confiante\npreparo similar" = "#32CD32", 
  "Mais confiante\nmelhor preparado" = "#006400")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Auto-confiança e preparo") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")
