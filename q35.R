#Qual o seu estado civil?

#Para variáveis qualitativas
df2 <- df2 |>
  mutate(q35_fator = as.factor(q35))

# Gráfico (com legendas reduzidas - códigos das legendas descritos no chunk)

g35 <- df2|>
  mutate(q35_codigo = case_when(
    q35_fator == "Casado(a)" ~ "Cas.",
    q35_fator == "Solteiro(a)" ~ "Solt.", 
    q35_fator == "Separado(a)" ~ "Sep.",
    q35_fator == "Viúvo(a)" ~ "Viu."
  ))|>
  tidyplot(x = q35_codigo, fill = q35_codigo)|>
  add_barstack_absolute()|>
  adjust_x_axis_title("Estado civil")|>
  adjust_y_axis_title("Contagem")|>
  sort_x_axis_levels()|>
  adjust_colors(new_colors = c("Cas." = "#c0392b",
    "Solt." = "#e74c3c", "Sep." = "#2ecc71", "Viu." = "#27ae60"))|>
  adjust_x_axis(labels = NULL) |>
  adjust_y_axis(labels = NULL) |>
  adjust_legend_title("Categoria")|>
  adjust_legend_position("bottom") 
