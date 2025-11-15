# Como você se considera?
# Raça/cor

#Para variáveis qualitativas

tabela_9 <- df2 |>
  count(q36, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)) |>
  arrange(desc(Frequência_Absoluta))

g36 <- knitr::kable(tabela_9, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
