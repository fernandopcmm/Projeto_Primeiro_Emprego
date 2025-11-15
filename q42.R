#Indique a resposta que melhor descreve sua atual situação de moradia

tabela_q42 <- df2 |>
  filter(!is.na(q42)) |>
  count(q42, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g42 <- knitr::kable(tabela_q42, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
