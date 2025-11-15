#Município de moradia e município onde trabalha
# Avaliação em conjunto de g32 e g33 para saber se os beneficiários residem
# no municípioonde trabalham

g32 <- df2 |>
  filter(!is.na(q32), !is.na(q33)) |>
  count(mesmo_municipio = q32 == q33) |>
  mutate(perc = n/sum(n)*100) |>
  mutate(mesmo_municipio = ifelse(mesmo_municipio, "Sim", "Não"))

g32 <- knitr::kable(g32, 
      col.names = c("Trabalha no mesmo município", "Frequência Absoluta", "Percentual"),
      align = c("l", "c", "c"))