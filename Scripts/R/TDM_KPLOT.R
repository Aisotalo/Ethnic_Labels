#This includes an example paths, make sure that it matches the absolute path on your local machine.
paths <- list.files("~/Ethnic_Labels/Articles/Articles_AA/ngram_output/")
if (length(paths) > 1){
	mergetable <- read.csv(paste("~/Ethnic_Labels/Articles/Articles_AA/ngram_output/", paths[1], sep=""), header=F)
	names(mergetable) <- c("token", paths[1])
#set [2:X] where X is how many total documents to include in the term-document matrix	
  for (i in paths[2:60]) {
		fname <- paste("~/Ethnic_Labels/Articles/Articles_AA/ngram_output/", i, sep="")
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
#This transposes the tokens and documents to use as input to Kmeans clustering
TDM <- as.data.frame(t(mergetable[,-1]))
colnames(TDM) <- n
KM <- kmeans(TDM, centers=5)
# Here is an example line if you are interested in outputting the cluter information into a csv
##write.csv(KM$cluster, file="~/Ethnic_Labels/Articles/Articles_AA/ngram_output/clusters.csv")
cluster.plot <- plot(KM$cluster)
#clstr <- KM$cluster
#clstr <- as.data.frame(clstr)