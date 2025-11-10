#Quais são suas principais sugestões para aprimorar o PPE, especialmente nas áreas 
#de acolhimento, articulação, comunicação e acompanhamento?

# Análise de tokens mais frequentes
tokens_q19 <- df2 |>
  select(q19) |>
  unnest_tokens(word, q19) |>
  filter(!word %in% stopwords::stopwords("pt")) |>
  filter(str_length(word) > 3) |> 
  count(word, sort = TRUE) |>
  head(30)  # Top 30 palavras

# Gráfico de nuvem de palavras
g19 <- tokens_q19 |>
  ggplot(aes(label = word, size = n, color = n)) +
  geom_text_wordcloud_area(rm_outside = TRUE) +
  scale_size_area(max_size = 25) +
  scale_color_gradient(low = "blue", high = "red") +
  theme_minimal() +
  labs(title = "Sugestões para aprimorar o PPE")

# Análise de sentenças completas contendo os principais tokens
palavras_chave <- tokens_q19$word[1:10]  # Top 10 palavras

# Extrair sentenças completas que contêm as palavras-chave
sentencas_q19 <- df2 |>
  select(q19) |>
  mutate(sentence = str_split(q19, "[.!?]")) |>  # Divide em sentenças
  unnest(sentence) |>
  mutate(sentence = str_trim(sentence)) |>
  filter(str_length(sentence) > 10) |> 
  mutate(has_keyword = map_lgl(sentence, ~any(str_detect(.x, fixed(palavras_chave))))) |>
  filter(has_keyword) |>
  select(sentence) |>
  distinct()

# Criar tabela com exemplos contextuais
tabela_contexto4 <- sentencas_q19 |>
  head(10) %>%  # Primeiras 10 sentenças exemplares
  mutate(Id = row_number()) |>
  select(Id, Sentença = sentence)
