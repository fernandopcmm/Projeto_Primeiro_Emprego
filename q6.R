#Em uma escala de 1 a 5, onde 1 é "Muito insatisfatório" e 5 é 
#"Muito satisfatório", avalie o processo de acolhimento dos 
#beneficiários/trabalhadores educandos do PPE? jovens no seu orgão/instituição

#Para variáveis qualitativas ordinais
df2 <- df2 |>
  mutate(q6_fator = factor(q6,levels = c(1, 2, 3, 4, 5),
    labels = c("1", "2", "3", "4", "5"),
    ordered = TRUE))

# Gráfico

g6 <- df2|>
  tidyplot(x = q6_fator)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("1 = Muito insatisfatório e \n 5 = Muito satisfatório")
