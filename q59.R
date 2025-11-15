#Tentou acesso em alguma universidade?

df2 <- df2 %>%
  mutate(q59 = factor(q59))

g59 <- df2|>
  tidyplot(x = q59)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Tentou acesso a universidade?")
