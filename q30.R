# Ano de conclusão do ensino médio?

# Junção de categorias antes de 2015
df2 <- df2 |>
  filter(!is.na(q30)) |>
  mutate(q30_fator = factor(if_else(q30 <= 2015, "Até 2015", as.character(q30)),
  ordered = TRUE))

tabela_7 <- df2 %>%
  count(q30_fator, name = "Frequência_Absoluta") %>%
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
    accuracy = 0.1)
  ) %>%
  arrange(desc(Frequência_Absoluta))

g30 <- knitr::kable(tabela_7, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))