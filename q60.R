#Antes do PPE, você já havia trabalhado, mesmo que informalmente?

df2 <- df2 %>%
  mutate(q60 = factor(q60))

g60 <- df2|>
  tidyplot(x = q60)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Já havia trabalhado antes do PPE?")
