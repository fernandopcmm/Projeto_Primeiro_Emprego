# Em uma escala de 1 a 5, onde 1 é "nada desafiador e 5 é "extremamente 
# desafiador", avalie o nível geral de desafio do seu papel como ponto focal

#Para variáveis qualitativas ordinais
df2 <- df2 |>
  mutate(q3_fator = factor(q3,levels = c(1, 2, 3, 4, 5),
    labels = c("1", "2", "3", "4", "5"),
    ordered = TRUE))

# Gráfico

g3 <- df2|>
  tidyplot(x = q3_fator)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("1 = Nada desafiador e \n 5 = Extremamente desafiador")