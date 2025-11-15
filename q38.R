#Com quem você mora atualmente?

tabela_q38 <- df2 |>
  filter(!is.na(q38)) |>
  count(q38, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g38 <- knitr::kable(tabela_q38, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
