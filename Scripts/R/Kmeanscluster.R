library(cluster)
library(fpc)

data(iris)
dat <- iris[, -5] # without known classification 
# Kmeans clustre analysis
clus <- kmeans(dat, centers=3)

# Fig 01
plotcluster(dat, clus$cluster)
