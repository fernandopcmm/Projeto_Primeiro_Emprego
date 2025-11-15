#Considerando o objetivo profissional de antes do PPE, como se sente agora?

tabela_q64 <- df2 |>
  filter(!is.na(q64)) |>
  count(q64, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g64 <- knitr::kable(tabela_q64, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))