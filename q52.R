#Como você caracteriza sua experiência no 
#uso de recursos audiovisuais e tecnológicos no trabalho?

g52 <- df2 |>
  mutate(q52_fator = factor(q52,
    levels = c("Amplo e adequado", "Amplo, mas inadequado", "Restrito, mas adequado", 
    "Restrito e inadequado", "A organização não dispões desses recursos/meios"),
    labels = c("Amplo e\nadequado", "Amplo, mas\ninadequado", "Restrito, mas\nadequado", 
    "Restrito e\ninadequado", "Sem\nrecursos"),
    ordered = TRUE)) |>
  tidyplot(x = q52_fator, fill = q52_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Amplo e\nadequado" = "#006400", 
  "Amplo, mas\ninadequado" = "#32CD32", 
  "Restrito, mas\nadequado" = "#FFA500", 
  "Restrito e\ninadequado" = "#FF8C00",
  "Sem\nrecursos" = "#FF0000")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Acesso a recursos e meios") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")
