# Gênero
# Feminino,masculino,não binário

g24 <- df2|>
  tidyplot(x = q24)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Categoria")
