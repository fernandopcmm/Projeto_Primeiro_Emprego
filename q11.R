#Quais canais de comunicação são mais frequentemente utilizados para 
#contato entre você e a entidade parceira do PPE, FLEM ou FESFSUS

tabela_2 <- df2 |>
  filter(q11 %in% c("E-mail", "Whatsapp", "Telefone fixo", "Telefone celular", 
  "Reuniões presenciais","Reuniões por videoconferência"))|>
  count(q11, name = "Frequência_Absoluta")|>
  mutate(Percentual = scales::percent(Frequência_Absoluta / sum(Frequência_Absoluta), 
  accuracy = 0.1))|>
  arrange(desc(Frequência_Absoluta))

g11 <- knitr::kable(tabela_2, 
      col.names = c("Categoria", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))

# Inserindo icones
g11 <- data.frame(
  Ícone = c("💬", "📧", "👥", "📱"),
  Categoria = c("Whatsapp", "E-mail", "Reuniões presenciais", "Telefone celular"),
  Frequência_Absoluta = c(34, 20, 2, 1),
  Percentual = c("59.6%", "35.1%", "3.5%", "1.8%")
)

g11 <- knitr::kable(g11, 
  align = c("c", "l", "c", "c"),
  col.names = c("Ícone", "Categoria", "Frequência Absoluta", "Percentual"))


# Box-plot relacionando q11 e q10 - USANDO DADOS ORIGINAIS
contig3 <- df2 |>
  filter(q11 %in% c("E-mail", "Whatsapp", "Telefone fixo",
    "Reuniões presenciais", "Reuniões por videoconferência")) |>
    ggplot(aes(x = q11, y = q10, fill = q11)) +
    geom_violin() +
    geom_jitter(width = .1, alpha = 0.6) +
    labs(x = "Canal de comunicação", y = "Qualidade da comunicação 1 - 5") +
    guides(fill = guide_legend(title = NULL)) +
    theme(axis.text.x = element_blank())
