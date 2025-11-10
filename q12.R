#Com que frequência você acompanha o desempenho das atividades dos beneficiários/
#trabalhadores educandos em sua unidade? das atividades e do desempenho dos 
#jovens em sua unidade?

tabela_3 <- df2 |>
  filter(q12 %in% c("Diariamente", "Semanalmente", "QUinzenalmente", "Mensalmente"))|>
  count(q12, name = "Frequência") |>
  mutate(
    Percentual = scales::percent(Frequência / sum(Frequência), accuracy = 0.1),
    Ícone = case_when(
      q12 == "Diariamente" ~ "📅",
      q12 == "Semanalmente" ~ "🗓️",
      q12 == "Quinzenalmente" ~ "📆", 
      q12 == "Mensalmente" ~ "📊"
    )
  ) |>
  arrange(desc(Frequência))

g12 <- knitr::kable(tabela_3, 
  col.names = c("Período", "Frequência", "Percentual", "Ícone"),
  align = c("l", "c", "c", "c"))
