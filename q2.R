#Qual sua principal atribuição como Ponto Focal do PPE? 

#variável qualitativa nominal

# Utilidade:
# Para questões qualitativas com categorias sendo textos longos

# Ordenar por frequência (opcional)

tabela_1 <- df2 %>%
  count(q2, name = "Frequência_Absoluta") %>%
  mutate(
    Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), accuracy = 0.1)
  ) %>%
  arrange(desc(Frequência_Absoluta))

g2 <- knitr::kable(tabela_1, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))
