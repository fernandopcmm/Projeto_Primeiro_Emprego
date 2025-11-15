#Quantos livros você leu nos últimos 12 meses?

g47 <- df2 |>
  mutate(q47 = case_when(
    q47 %in% c("Nenhum") ~ "0",
    q47 == "Um ou dois" ~ "1-2",
    q47 == "Entre três e cinco" ~ "3-5", 
    q47 == "Entre seis e oito" ~ "6-8",
    q47 == "Mais de oito" ~ "8+",
    TRUE ~ q47
  ),
  q47 = factor(q47,
    levels = c("0", "1-2", "3-5", "6-8", "8+"),
    ordered = TRUE)) |>
  tidyplot(x = q47) |>
  add_count_bar() |>
  adjust_x_axis_title("Livros lidos no último ano") |>
  adjust_y_axis_title("Frequência")
