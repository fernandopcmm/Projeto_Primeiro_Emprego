#Antes de ingressar no PPE, qual era a renda média mensal da sua família?
# Comparação do atual com antes q40 - q43

g43 <- df2 |>
  mutate(q43 = case_when(
    q43%in% c("De 4,5 a 6 salários mínimos", "De 6 a 10 salários mínimos") ~ "4,5+",
    q43 == "Até 1,5 Salários mínimos" ~ "Até 1,5",
    q43 == "Entre 1,5 a 3 salários mínimos" ~ "1,5-3", 
    q43 == "De 3 a 4,5 salários mínimos" ~ "3-4,5",
    TRUE ~ q43
  ),
  q43 = str_remove_all(q43, "salários mínimos|Salários mínimos|salários"),
  q43 = str_trim(q43),
  q43 = factor(q43,
    levels = c("Nenhuma", "Até 1,5", "1,5-3", "3-4,5", "4,5+"),
    ordered = TRUE)) |>
  tidyplot(x = q43) |>
  add_count_bar() |>
  adjust_x_axis_title("Renda familiar") |>
  adjust_y_axis_title("Frequência")

# Mudança de curto prazo na renda familiar
contig4 <- df2 |>
  filter(!is.na(q40), !is.na(q43)) |>
  mutate(
    nivel_atual = factor(q40, levels = c("Nenhuma", "Até 1,5 Salários mínimos", "Entre 1,5 a 3 salários mínimos", "De 3 a 4,5 salários mínimos", "De 4,5 a 6 salários mínimos", "De 6 a 10 salários mínimos")),
    nivel_antes = factor(q43, levels = c("Nenhuma", "Até 1,5 Salários mínimos", "Entre 1,5 a 3 salários mínimos", "De 3 a 4,5 salários mínimos", "De 4,5 a 6 salários mínimos", "De 6 a 10 salários mínimos")),
    mudanca_renda = case_when(
      nivel_atual == nivel_antes ~ "Manteve",
      as.numeric(nivel_atual) > as.numeric(nivel_antes) ~ "Aumentou",
      TRUE ~ "Diminuiu"
    ),
    mudanca_renda = factor(mudanca_renda, levels = c("Aumentou", "Manteve", "Diminuiu"))
  ) |>
  tidyplot(x = mudanca_renda, fill = mudanca_renda) |>
  add_count_bar() |>
  adjust_colors(new_colors = c("Aumentou" = "#6BCF7F", "Manteve" = "#FFD93D", "Diminuiu" = "#FF6B6B")) |>
  adjust_x_axis_title("Mudança na Renda Familiar") |>
  adjust_y_axis_title("Frequência")|>
  adjust_legend_title("Situação")|>
  adjust_legend_position(position = "bottom")
