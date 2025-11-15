#As condições gerais das instalações físicas do seu trabalho são adequadas?

#Para variáveis qualitativas ordinais com esquema de cores
g49 <- df2 |>
  mutate(q49_fator = factor(q49,
    levels = c("Sim, todas", "Sim, a maior parte", "Somente algumas", "Nenhuma"),
    ordered = TRUE)) |>
  tidyplot(x = q49_fator, fill = q49_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Sim, todas" = "#006400", "Sim, a maior parte" = "#32CD32", 
  "Somente algumas" = "#FFA500", "Nenhuma" = "#FF0000")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Condições das instalações físicas")|>
  adjust_legend_title(title = NULL)|>
  remove_x_axis_labels()
