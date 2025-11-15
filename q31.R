# Qual a sua formação técnica?

# Análise de tokens mais frequentes

tokens_q31 <- df2 |>
  select(q31) |>
  unnest_tokens(word, q31) |>
  filter(!word %in% stopwords::stopwords("pt")) |>
  filter(str_length(word) > 3) |> 
  count(word, sort = TRUE) |>
  head(30)  # Top 30 palavras

# Gráfico de nuvem de palavras
g31 <- tokens_q31 |>
  ggplot(aes(label = word, size = n, color = n)) +
  geom_text_wordcloud_area(rm_outside = TRUE) +
  scale_size_area(max_size = 35) +
  scale_color_gradient(low = "blue", high = "red") +
  theme_minimal() +
  labs(title = "Principais desafios do Projeto Primeiro Emprego")
