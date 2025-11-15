#Assinale a situação financeira que 
# melhor descreve seu caso (considerando o PPE como renda)

tabela_q41 <- df2 |>
  filter(!is.na(q41)) |>
  count(q41, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g41 <- knitr::kable(tabela_q41, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
