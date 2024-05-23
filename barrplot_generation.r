# Packages import
list.of.packages <- c("ggplot2", "hrbrthemes", "extrafont", "ggsignif", "ggpattern")
new.packages <- list.of.packages[!(list.of.packages %in%
    installed.packages()[, "Package"])]
if (length(new.packages)) {
    install.packages(new.packages, repos = "https://pbil.univ-lyon1.fr/CRAN/")
}
lapply(list.of.packages, require, character.only = TRUE)

percent <- c(80, 40, 50, 90)
type <- c("Python", "R", "Python", "R")
annot <- c("Ergonomie", "Ergonomie", "Beauté graphique", "Beauté graphique")
input <- data.frame(percent, type, annot)


plot <- ggplot(data = input, aes(x = annot, y = percent, fill = type)) +
    geom_bar_pattern(
        aes(pattern = type,),
        pattern_fill = "#616161", pattern_colour = "#616161", pattern_scale = 0.5, pattern_res = 1000, 
        stat = "identity",
        position = position_dodge(),
        color = "black"
    ) +
    coord_flip() +
    labs(fill = type) +
    theme(
        axis.title.y = element_blank(), axis.title.x = element_blank(),
        axis.text.x.top = element_text(),
        axis.ticks.x.top = element_line(),
    ) +
    scale_x_discrete(position = "top") +
    ylim(0, 100) +
    theme_ipsum(grid = FALSE) +
    geom_signif(
        annotations = c("***", "*"),
        y_position = c(95, 85),
        tip_length = 0.01,
        map_signif_level = TRUE,
        textsize = 10,
        xmin = c(0.7, 1.7),
        xmax = c(1.3, 2.3),
        size = 1
    ) +
    scale_fill_manual(values = c("R" = "#f850f8", "Python" = "#79ffe9"))

ggsave(
    "output/fun_barrplot.png",
    plot,
    height = 5,
    width = 15
)
