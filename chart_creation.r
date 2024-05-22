#Packages import
list.of.packages <- c("ggplot2","ggridges","viridis", "hrbrthemes")
new.packages <- list.of.packages[!(list.of.packages %in%
                                     installed.packages()[,"Package"])]
if(length(new.packages))
  install.packages(new.packages,repos="https://pbil.univ-lyon1.fr/CRAN/")
lapply(list.of.packages,require,character.only=TRUE)

#font_import()
#loadfonts(device = "win")

data =read.table("data/data.csv", header = TRUE, sep = ";")
print(head(data))

plot <- ggplot(data, aes(x = Time, y = Type, fill = ..x..)) +
  geom_density_ridges_gradient() +
  labs() +
  scale_fill_viridis(option="magma") +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    
  )

ggsave(
    "Distribution.png",
    plot,
    height = 5 ,
    width = 20
  )