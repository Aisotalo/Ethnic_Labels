c6 <- c("red", "forest green", "blue", "purple2", "goldenrod4", "gray20")
for(k in 2:5)
  plot(silhouette(pam(ruspini, k=k)), main = paste("k = ",k), do.n.k=FALSE,
       col = c6[1:k])