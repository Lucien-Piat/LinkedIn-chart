# Packages import
list.of.packages <- c("ggplot2", "ggridges", "viridis", "hrbrthemes", "extrafont", "scales")
new.packages <- list.of.packages[!(list.of.packages %in%
    installed.packages()[, "Package"])]
if (length(new.packages)) {
    install.packages(new.packages, repos = "https://pbil.univ-lyon1.fr/CRAN/")
}
lapply(list.of.packages, require, character.only = TRUE)

percent <- c(30,70,50,70)
type <- c("R","P","R","P")
annot <- c("speed", "speed", "plot", "plot")
input <- data.frame(percent, type, annot)


plot <- ggplot(data=input, aes(x=annot, y=percent, fill=type)) +
    geom_bar(stat="identity", position=position_dodge()) +
    coord_flip() +
    theme(axis.title.y=element_blank(), axis.title.x=element_blank(),
          axis.text.x.top = element_text(), 
          axis.ticks.x.top = element_line()) +
    scale_x_discrete(position = "top") +
    ylim(0, 100)
    


ggsave(
    "output/fun_barrplot.png",
    plot,
    height = 5,
    width = 15
)