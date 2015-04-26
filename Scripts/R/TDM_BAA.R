paths <- list.files("/home/tripdubz/asklingstats/ngrams_cut/")
if (length(paths) > 1){
	mergetable <- read.csv(paste("/home/tripdubz/asklingstats/ngrams_cut/", paths[4009], sep=""), header=F)
	names(mergetable) <- c("token", paths[4009])
	for (i in paths[4010:4030]) {
		fname <- paste("/home/tripdubz/asklingstats/ngrams_cut/", i, sep="")
		doc <- read.csv(fname, header=F)
		print(fname)
		names(doc) <- c("token", i)
		tmptable <- merge(mergetable, doc, by="token", all=T)
		mergetable <- tmptable
		tmptable <- NULL
		mergetable[is.na(mergetable)] <- 0.0
  }
}
n <- mergetable$token
TDM <- as.data.frame(t(mergetable[,-1]))
colnames(TDM) <- n
KM <- kmeans(TDM, centers=5)
write.csv(KM$cluster, file="/home/tripdubz/asklingstats/CLUSTERS/5C.csv")
cluster.plot <- plot(KM$cluster)
#clstr <- KM$cluster
#clstr <- as.data.frame(clstr)