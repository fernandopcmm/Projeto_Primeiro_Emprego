# Orientação sexual
# Heterossexual, homossexual,bissexual, lésbica, não responde e NA

df2 <- df2 |>
  mutate(q25 = case_when(
    is.na(q25) | q25 == "Não responde" ~ "Não respondeu",
    q25 == "Lésbica" ~ "Homossexual",
    TRUE ~ q25
  ))
tabela_6 <- df2 %>%
  count(q25, name = "Frequência_Absoluta") %>%
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), accuracy = 0.1)
  ) %>%
  arrange(desc(Frequência_Absoluta))

g25 <- knitr::kable(tabela_6, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
