#Em uma escala de 1 a 5, onde 1 é "muito insatisfatório" e 5 é "muito satisfatório",
#  avalie a clareza e frequência da comunicação entre a entidade parceira do PPE, 
#FLEM ou FESFSUS com você como Ponto Focal.

#Para variáveis qualitativas ordinais
df2 <- df2 |>
  mutate(q10_fator = factor(q10,levels = c(1, 2, 3, 4, 5),
    labels = c("1", "2", "3", "4", "5"),
    ordered = TRUE))

# Gráfico

g10 <- df2|>
  tidyplot(x = q10_fator)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("1 = Muito insatisfatório e \n 5 = Muito satisfatório")
