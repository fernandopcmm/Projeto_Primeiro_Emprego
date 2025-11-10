#Em que medida você acredita que o processo de acolhimento contribui para 
#a integração dos jovens na equipe de trabalho?

#Para variáveis qualitativas com quantitativas
df2 <- df2 |>
  mutate(q8_fator = as.factor(q8))

# Gráfico (com legendas reduzidas - códigos das legendas descritos no chunk)

g8 <- df2|>
  mutate(q8_codigo = case_when(
    q8_fator == "Contribui pouco ou nada" ~ "CP",
    q8_fator == "Contribui em alguma medida" ~ "CA", 
    q8_fator == "Contribui significativamente" ~ "CS",
    q8_fator == "É fundamental" ~ "EF"
  ))|>
  tidyplot(x = q8_codigo, fill = q8_codigo)|>
  add_barstack_absolute()|>
  adjust_x_axis_title("Contribuição do acolhimento para integração")|>
  adjust_y_axis_title("Contagem")|>
  sort_x_axis_levels()|>
  adjust_colors(new_colors = c("CP" = "#c0392b",
    "CA" = "#e74c3c", "CS" = "#2ecc71", "EF" = "#27ae60"))|>
  adjust_x_axis(labels = NULL) |>
  adjust_y_axis(labels = NULL) |>
  adjust_legend_title("Categoria")|>
  adjust_legend_position("bottom") 

# Box-plot relacionando q8 e q6
contig2 <-   ggplot(df2, aes(x = q8, y = q6, fill = q8))+
  geom_violin()+
  geom_jitter(width = .1)+
  labs(x = "Contribuição do acolhimento", y = "Grau de acolhimento 1 - 5")+
  guides(fill = guide_legend(title = NULL))+
  theme(axis.text.x = element_blank()) 
