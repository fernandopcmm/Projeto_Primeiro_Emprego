#Como você avalia o relacionamento interpessoal com os colegas de trabalho?

g53 <- df2 |>
  mutate(q53_fator = factor(q53,
    levels = c("É bem saudável", "É relativamente saudável", "É pouco saudável", "Não é saudável"),
    labels = c("Bem\nsaudável", "Relativamente\nsaudável", "Pouco\nsaudável", "Não é\nsaudável"),
    ordered = TRUE)) |>
  tidyplot(x = q53_fator, fill = q53_fator) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Bem\nsaudável" = "#006400", 
  "Relativamente\nsaudável" = "#32CD32", 
  "Pouco\nsaudável" = "#FFA500", 
  "Não é\nsaudável" = "#FF0000")) |>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Ambiente de trabalho") |>
  adjust_legend_title(title = NULL) |>
  remove_x_axis_labels() |>
  adjust_legend_position(position = "bottom")
