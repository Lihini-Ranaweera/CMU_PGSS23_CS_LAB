#install.packages("readr")
#install.packages("ggplot2")
#install.packages("cowplot")
#install.packages("languageserver")
library(readr)

iris <- read_csv("C:/Users/lihin/OneDrive/Documents/PGSS Computer Science Lab/CMU_PGSS23_CS_LAB/Week 1/iris.csv", 
                 col_names = FALSE, col_types = cols(X1 = col_double()))
colnames(iris) <- c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width", "Species")
# View(iris)

iris$Species <- as.factor(iris$Species)

# Establish the class of each column of the data frame
print(sapply(iris, class))


# Visualize the distribution of Species in a frequency table
print(table(iris$Species))

# Generate ggplot diagram to visualize a boxplot of Sepal.Width by Species and write this plot out to an image 
# install.packages("ggplot2"); install.packages("cowplot")
library(ggplot2)
library(cowplot)
p1 <- ggplot(iris) + geom_boxplot(aes(x=Species, y=Sepal.Width, color=Species), outlier.alpha = 0.1) + theme_minimal()
save_plot("C:/Users/lihin/OneDrive/Documents/PGSS Computer Science Lab/CMU_PGSS23_CS_LAB/Week 1/iris.png", p1, base_height=4, base_width=4, limitsize=FALSE)