#Até que nível seu pai estudou?

tabela_q45 <- df2 |>
  filter(!is.na(q45)) |>
  count(q45, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g45 <- knitr::kable(tabela_q45, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
