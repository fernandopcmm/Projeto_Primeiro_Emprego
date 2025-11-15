#Até que nível sua mãe estudou?

tabela_q46 <- df2 |>
  filter(!is.na(q46)) |>
  count(q46, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g46 <- knitr::kable(tabela_q46, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
