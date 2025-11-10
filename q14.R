#Questões de concordância q14 a q18

# Criar tabela consolidada
tabela_4 <- df2 |>
  select(q14, q15, q16, q17, q18) |>
  pivot_longer(
    cols = everything(),
    names_to = "Questão",
    values_to = "Resposta"
  ) |>
  mutate(Questão = case_when(
    Questão == "q14" ~ "Proatividade",
    Questão == "q15" ~ "Imaturidade como desafio",
    Questão == "q16" ~ "Clareza de objetivos",
    Questão == "q17" ~ "Adaptação ao serviço público", 
    Questão == "q18" ~ "Relação com demais trabalhadores")) |>
  count(Questão, Resposta) |>
  group_by(Questão) |>
  mutate(
    Frequência_Relativa = n / sum(n),
    Percentual = scales::percent(Frequência_Relativa, accuracy = 0.1)
  ) |>
  ungroup() |>
  select(-n, -Frequência_Relativa) |>
  pivot_wider(
    names_from = Resposta,
    values_from = Percentual,
    values_fill = "0.0%"
  ) |>
  select(Questão, `1`, `2`, `3`, `4`, `5`)

# Visualizar a tabela
g14 <- knitr::kable(tabela_4, 
  col.names = c("Questão", "1", "2", "3", "4", "5"),
  align = c("l", "c", "c", "c", "c", "c"))

