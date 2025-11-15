#Como você avalia o desejo de continuar estudando?

g58 <- df2 |>
  mutate(q58 = factor(q58,
    levels = c("Muito alto", "Alto", "Regular", "Fraco","Muito fraco"),
    ordered = TRUE)) |>
  tidyplot(x = q58, fill = q58) |>
  add_count_bar() |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Categoria") |>
  adjust_legend_title(title = "Legenda") |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "right")|>
  remove_legend_title()
