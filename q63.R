#Antes do PPE, qual era seu maior objetivo profissional?

tabela_q63 <- df2 |>
  filter(!is.na(q63)) |>
  count(q63, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g63 <- knitr::kable(tabela_q63, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
