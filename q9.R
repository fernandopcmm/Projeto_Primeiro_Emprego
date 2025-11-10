#De que forma o jovem é geralmente inserido na cultura organizacional 
# do seu orgão?

#Para variáveis qualitativas com quantitativas
df2 <- df2 |>
  mutate(q9_fator = as.factor(q9))

# Gráfico (com legendas reduzidas - códigos das legendas descritos no chunk)
# Também contém a categoria Outros

g9 <- df2|>
  mutate(q9_codigo = case_when(
    q9_fator == "Apresentação formal à equipe" ~ "AE",
    q9_fator == "Acompanhamento por um profissional/colega ou servidor mais experiente" ~ "AP", 
    q9_fator == "Participação em eventos" ~ "PE",
    q9_fator == "Acesso a materiais institucionais" ~ "AM"
  ))|>
  tidyplot(x = q9_codigo, fill = q9_codigo)|>
  add_barstack_absolute()|>
  adjust_x_axis_title("Tipo de inserção do jovem na cultura")|>
  adjust_y_axis_title("Contagem")|>
  sort_x_axis_levels()|>
  adjust_x_axis(labels = NULL) |>
  adjust_y_axis(labels = NULL) |>
  adjust_legend_title("Categoria")|>
  adjust_legend_position("bottom") 

# Extrair sentenças completas da q9
# Extrair sentenças completas que contêm as palavras-chave

tokens_q9 <- df2 |>
  select(q9) |>
  unnest_tokens(word, q9) |>
  filter(!word %in% stopwords::stopwords("pt")) |>
  filter(str_length(word) > 3) |> 
  count(word, sort = TRUE) |>
  head(30) 

palavras_chave <- tokens_q9$word[1:30]  # Top 10 palavras

sentencas_q9 <- df2 |>
  select(q9) |>
  filter(!q9 %in% c("Apresentação formal à equipe", 
    "Acompanhamento por um profissional/colega ou servidor mais experiente",
    "Participação em eventos", 
    "Acesso a materiais institucionais"))|>
  mutate(sentence = str_split(q9, "[.!?]")) |>  # Divide em sentenças
  unnest(sentence) |>
  mutate(sentence = str_trim(sentence)) |>
  mutate(has_keyword = map_lgl(sentence, ~any(str_detect(.x, fixed(palavras_chave))))) |>
  filter(has_keyword) |>
  select(sentence) |>
  distinct()

# Criar tabela com exemplos contextuais
tabela_contexto3 <- sentencas_q9 |>
  head(10) %>%  # Primeiras 10 sentenças exemplares
  mutate(Id = row_number()) |>
  select(Id, Sentença = sentence)
