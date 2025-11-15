#Você considera que seu trabalho contribui para aquisição de cultura geral?

g55 <- df2 |>
  mutate(q55_fator = factor(q55,
    levels = c("Contribui amplamente", "Contribui parcialmente", 
    "Contribui muito pouco", "Não contribui"),
    labels = c("Contribui\namplamente", "Contribui\nparcialmente", 
    "Contribui\nmuito pouco", "Não\ncontribui"),
    ordered = TRUE)) |>
  tidyplot(x = q55_fator, fill = q55_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Contribui\namplamente" = "#006400", 
  "Contribui\nparcialmente" = "#32CD32", 
  "Contribui\nmuito pouco" = "#FFA500", 
  "Não\ncontribui" = "#FF0000")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Contribuição para formação profissional") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")
