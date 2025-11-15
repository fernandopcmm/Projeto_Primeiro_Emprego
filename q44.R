#Sua família recebe algum benefício social?

g44 <- df2 |>
  filter(!is.na(q44)) |>
  mutate(q44 = case_when(
    q44 %in% c("BPC", "Pensão", "Prouni", "CAD UNICO") ~ "Outros",
    q44 == "Bolsa família" ~ "BF",
    TRUE ~ q44
  )) |>
  tidyplot(x = q44) |>
  add_count_bar() |>
  adjust_x_axis_title("Benefício social") |>
  adjust_y_axis_title("Frequência")

