# ANo de entrada no PPE
# 2024 ou 2025


df2 <- df2 %>%
  mutate(q22 = factor(q22))

g22 <- df2|>
  tidyplot(x = q22)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Ano de entrada")
