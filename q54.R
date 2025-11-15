# Como você avalia o nível de exigência do trabalho?

g54 <- df2 |>
  mutate(q54_fator = factor(q54,
    levels = c("Deveria exigir muito menos", "Deveria exigir um pouco menos", 
    "Exige na medida certa", "Deveria exigir um pouco mais", 
    "Deveria exigir muitos mais"),
    labels = c("Exigir\nmuito menos", "Exigir\npouco menos", 
    "Na medida\ncerta", "Exigir\npouco mais", 
    "Exigir\nmuito mais"),
    ordered = TRUE)) |>
  tidyplot(x = q54_fator, fill = q54_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Exigir\nmuito menos" = "#FF0000", 
  "Exigir\npouco menos" = "#FF8C00", 
  "Na medida\ncerta" = "#32CD32", 
  "Exigir\npouco mais" = "#228B22",
  "Exigir\nmuito mais" = "#006400")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Nível de exigência do trabalho") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")
