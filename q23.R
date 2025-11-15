# Idade
# Criação de faixas etárias
idade_faixa <- df2 |>
  filter(q23 >= 16) |>
  mutate(faixa_etaria = case_when(
    q23 >= 16 & q23 <= 21 ~ "16 a 21",
    q23 >= 22 & q23 <= 25 ~ "22 a 25",
    q23 >= 26 & q23 <= 35 ~ "26 a 35",
    q23 > 35 ~ "Acima de 35"
  )) |>
  count(faixa_etaria)

idade_faixa <- idade_faixa |>
  mutate(perc = n/sum(n)*100)

g23 <- idade_faixa |>
  ggplot(aes(x = faixa_etaria, y = n, fill = faixa_etaria)) +
  geom_col() +
  geom_text(aes(label = paste0(n, " (", round(perc, 1), "%)")), vjust = -0.5) +
  labs(y = "Contagem", x = "Faixa etária", fill = "Faixa etária") +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

