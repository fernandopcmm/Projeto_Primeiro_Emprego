# Quala sua religião

tabela_q37 <- df2 |>
  filter(!is.na(q37)) |>
  count(q37, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g37 <- knitr::kable(tabela_q37, 
      col.names = c("Religião", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
