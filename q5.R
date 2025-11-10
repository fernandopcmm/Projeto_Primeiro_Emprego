#E quais são as 3 principais facilidades ou melhores 
# aspectos do seu papel como Ponto Focal?

# Análise de tokens mais frequentes
tokens_q5 <- df2 |>
  select(q5) |>
  unnest_tokens(word, q5) |>
  filter(!word %in% stopwords::stopwords("pt")) |>
  filter(str_length(word) > 3) |> 
  count(word, sort = TRUE) |>
  head(30) 

# Gráfico de nuvem de palavras
g5 <- tokens_q5 |>
  ggplot(aes(label = word, size = n, color = n)) +
  geom_text_wordcloud_area(rm_outside = TRUE) +
  scale_size_area(max_size = 25) +
  scale_color_gradient(low = "blue", high = "red") +
  theme_minimal() +
  labs(title = "Principais desafios do Projeto Primeiro Emprego")

# Análise de sentenças completas contendo os principais tokens
palavras_chave <- tokens_q5$word[1:10]  # Top 10 palavras

# Extrair sentenças completas que contêm as palavras-chave
sentencas_q5 <- df2 |>
  select(q5) |>
  mutate(sentence = str_split(q5, "[.!?]")) |>  # Divide em sentenças
  unnest(sentence) |>
  mutate(sentence = str_trim(sentence)) |>
  filter(str_length(sentence) > 10) |> 
  mutate(has_keyword = map_lgl(sentence, ~any(str_detect(.x, fixed(palavras_chave))))) |>
  filter(has_keyword) |>
  select(sentence) |>
  distinct()

# Criar tabela com exemplos contextuais
tabela_contexto2 <- sentencas_q5 |>
  head(10) %>%  # Primeiras 10 sentenças exemplares
  mutate(Id = row_number()) |>
  select(Id, Sentença = sentence)
