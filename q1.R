#library(tidyverse)
#library(tidyplots)

#Para variáveis qualitativas ordinais
df2 <- df2 |>
  mutate(q1_fator = factor(q1,levels = c(1, 2, 3, 4, 5),
    labels = c("1", "2", "3", "4", "5"),
    ordered = TRUE))

#No survey:
#Em uma escala de 1 a 5, onde 1 é "nada relevante" e 5 é "extremamente relevante", 
#quão relevante você considera o PPE na inserção de jovens no mundo do trabalho na Bahia?

# Pontos da escala agrupados em categorias
#Para questões globais sobre aceitação, importância, relevância, adoção
#para enfatizar visões antagônicas

df2 <- df2 |>
  mutate(
    tipoq1 = case_when(
      q1 %in% c(1, 2) ~ "Negativo",
      q1 == 3 ~ "Neutro",
      q1 %in% c(4, 5) ~ "Positivo"
    ),
    tipoq1 = factor(tipoq1, levels = c("Negativo", "Neutro", "Positivo")))

# Gráfico

g1 <- df2|>
  tidyplot(x = q1_fator, color = tipoq1)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_legend_title("Sentimento") |>
  adjust_x_axis_title("1 = Nada relevante e 5 = Muito relevante")|>
  adjust_x_axis(breaks = c(1:5), labels = c("1","2","3","4","5"))|>
  adjust_legend_position("bottom")
