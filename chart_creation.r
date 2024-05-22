#Packages import
list.of.packages <- c("ggplot2","ggridges","viridis", "hrbrthemes","extrafont", "scales")
new.packages <- list.of.packages[!(list.of.packages %in%
                                     installed.packages()[,"Package"])]
if(length(new.packages))
  install.packages(new.packages,repos="https://pbil.univ-lyon1.fr/CRAN/")
lapply(list.of.packages,require,character.only=TRUE)

#font_import()
#loadfonts(device = "win")

data =read.table("data/data.csv", header = TRUE, sep = ",")


plot <- ggplot(data, aes(x = Time, y = Type, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 2, rel_min_height = 0.01, panel_scaling = TRUE, gradient_lwd = 0) +
  labs() +
  scale_fill_viridis(direction = -1, option = "magma") +
  theme_ipsum() +
  theme(
    legend.position = "none",
    panel.spacing = unit(5, "lines"),
    strip.text.x = element_text(size = 8)
  ) +
  theme_ridges(font_size = 13, grid = FALSE) +
  scale_x_continuous(
    name = NULL,
    limits = c(0, 24), 
    breaks = seq(0, 24, by = 1),
    labels = function(x) paste0(x, "h")  # Custom x-axis labels
  )

ggsave(
    "output/fun_distribution_chart.png",
    plot,
    height = 5 ,
    width = 20
  )