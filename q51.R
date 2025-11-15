#A sua instituição empregadora te auxilia a progredir na carreira?

g51 <- df2 |>
  mutate(q51_fator = factor(q51,
    levels = c("Plenamente", "Parcialmente", "Pouco", "Não sinto que estou progredindo"),
    labels = c("Plenamente", "Parcialmente", "Pouco", "Não sinto\nprogresso"),
    ordered = TRUE)) |>
  tidyplot(x = q51_fator, fill = q51_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Plenamente" = "#006400", 
  "Parcialmente" = "#32CD32", 
  "Pouco" = "#FFA500", 
  "Não sinto\nprogresso" = "#FF0000")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Senso de progresso na vida") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")
