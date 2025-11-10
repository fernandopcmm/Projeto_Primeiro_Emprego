#O seu órgão possui protocolos ou diretrizes padronizadas para o acolhimento 
#de novos beneficiários/trabalhadores educandos do PPE?

#Para variáveis qualitativas com quantitativas
df2 <- df2 |>
  mutate(q7_fator = as.factor(q7))

# Gráfico

g7 <- df2|>
  tidyplot(x = q7_fator, fill = q7_fator)|>
  add_barstack_absolute()|>
  adjust_y_axis_title("Contagem") |>
  adjust_x_axis_title("Categoria")|>
  sort_x_axis_levels()|>
  adjust_colors(new_colors = c("Sim" = "#2ecc71","Não" = "gray70", "Talvez" = "gray70"))|>
  adjust_legend_position("none")

# Box-plot relacionando q7 e q6
contig1 <-   ggplot(df2, aes(x = q7, y = q6, fill = q7))+
  geom_violin()+
  geom_jitter(width = .1)+
  labs(x = "Uso de protocolos", y = "Grau de acolhimento 1 - 5")+
  guides(fill = guide_legend(title = NULL))


