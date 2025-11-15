#Você já trabalhou antes do PPE?

g29 <- df2|>
  tidyplot(x = q29)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Você já trabalhou antes do PPE?")

# Salvar como factor
#Para variáveis qualitativas ordinais
df2 <- df2 |>
  mutate(q29_fator = factor(q29,levels = c(0,1),
    labels = c("Não", "Sim"),
    ordered = TRUE))