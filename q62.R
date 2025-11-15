#Você acreditava que conseguiria um emprego formal antes do PPE?

g62 <- df2 |>
  mutate(q62_fator = factor(q62,
    levels = c("Não", "Talvez", "Sim, mas com muita dificuldade", "Sim, com certeza"),
    labels = c("Não", "Talvez", "Sim, com\ndificuldade", "Sim, com\ncerteza"),
    ordered = TRUE)) |>
  tidyplot(x = q62_fator, fill = q62_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Não" = "#FF0000", 
  "Talvez" = "#FFA500", 
  "Sim, com\ndificuldade" = "#32CD32", 
  "Sim, com\ncerteza" = "#006400")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Expectativa com emprego formal") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")
