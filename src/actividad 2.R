# * ---------------------------------------------------------------------------
# * INFORMATION STRUCTURES
# * https://github.com/VictorBenitoGR/InformationStructuresITESM
# * ---------------------------------------------------------------------------

# Packages
library(ggplot2)

# Bases de competencia
datos <- data.frame(
  Base = c(
    "Precio", "Publicidad", "Imagen", "Tecnología",
    "Diseño de producto", "Atención al cliente"
  ),
  Apple = c(7, 9, 9, 10, 10, 10),
  Microsoft = c(7, 7, 8, 9, 8, 7),
  Meta = c(8, 7, 5, , 7, 7)
)

# Reorder the data
datos_largo <- tidyr::gather(datos, Empresa, Calificación, -Base)

# Plot
actividad <- ggplot(datos_largo, aes(
  x = Base, y = Calificación, fill = Empresa
)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Análisis de Bases de Competencia",
    x = "Bases de competencia",
    y = "Calificación"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save
ggsave("./assets/actividad.jpg", actividad,
  width = 8, height = 6
)
