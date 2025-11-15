# Participa de alguma rede social?


# Remoção de respostas inválidas e junção de categorias com mesmo sentido
dfaux <- df2 |>
  mutate(q21 = case_when(
    q21 %in% c("Não participa", "Não participo", "Nenhuma", "Não tenho") ~ "Não participa de rede social",
    TRUE ~ q21
  )) |>
  filter(q21 %in% c("Instagram", "LinkedIn", "Facebook", 
"Tik Tok", "Não participa de rede social"))

tabela_5 <- dfaux |>
  count(q21, name = "Frequência_Absoluta") |>
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), accuracy = 0.1)
  ) |>
  arrange(desc(Frequência_Absoluta))

g21 <- knitr::kable(tabela_5, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
