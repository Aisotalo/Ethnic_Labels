library(cluster)
library(HSAUR)
library(cluster)
library(fpc)
library(ellipse)
library(kknn)
#setwd("~/Ethnic_Labels/Data/ngrams_AA/")
#Unigram Analysis
nyt_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/unigrams_nyt_AA.txt", sep="\t", head=F)
twp_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/unigrams_twp_AA.txt", sep="\t", head=F)
wsj_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/unigrams_wsj_AA.txt", sep="\t", head=F)
nyt_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/unigrams_nyt_AA.txt", sep="\t", head=F)
twp_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/unigrams_twp_AA.txt", sep="\t", head=F)
wsj_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/unigrams_wsj_AA.txt", sep="\t", head=F)

#Bigram Analysis
#nyt_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/bigrams_nyt_AA.txt", sep="\t", head=F)
#twp_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/bigrams_twp_AA.txt", sep="\t", head=F)
#wsj_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/bigrams_wsj_AA.txt", sep="\t", head=F)
#nyt_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/bigrams_nyt_AA.txt", sep="\t", head=F)
#twp_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/bigrams_twp_AA.txt", sep="\t", head=F)
#wsj_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/bigrams_wsj_AA.txt", sep="\t", head=F)

#Trigram Analysis
#nyt_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/trigrams_nyt_AA.txt", sep="\t", head=F)
#twp_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/trigrams_twp_AA.txt", sep="\t", head=F)
#wsj_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/trigrams_wsj_AA.txt", sep="\t", head=F)
#nyt_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/trigrams_nyt_AA.txt", sep="\t", head=F)
#twp_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/trigrams_twp_AA.txt", sep="\t", head=F)
#wsj_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/trigrams_wsj_AA.txt", sep="\t", head=F)

#4gram Analysis
#nyt_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/4grams_nyt_AA.txt", sep="\t", head=F)
#twp_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/4grams_twp_AA.txt", sep="\t", head=F)
#wsj_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/4grams_wsj_AA.txt", sep="\t", head=F)
#nyt_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/4grams_nyt_AA.txt", sep="\t", head=F)
#twp_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/4grams_twp_AA.txt", sep="\t", head=F)
#wsj_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/4grams_wsj_AA.txt", sep="\t", head=F)

#5gram Analysis
#nyt_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/5grams_nyt_AA.txt", sep="\t", head=F)
#twp_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/5grams_twp_AA.txt", sep="\t", head=F)
#wsj_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/5grams_wsj_AA.txt", sep="\t", head=F)
#nyt_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/5grams_nyt_AA.txt", sep="\t", head=F)
#twp_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/5grams_twp_AA.txt", sep="\t", head=F)
#wsj_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/5grams_wsj_AA.txt", sep="\t", head=F)

#6gram Analysis
#nyt_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/6grams_nyt_AA.txt", sep="\t", head=F)
#twp_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/6grams_twp_AA.txt", sep="\t", head=F)
#wsj_abs <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/6grams_wsj_AA.txt", sep="\t", head=F)
#nyt_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/nyt/6grams_nyt_AA.txt", sep="\t", head=F)
#twp_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/twp/6grams_twp_AA.txt", sep="\t", head=F)
#wsj_rel <- read.table(file="~/Ethnic_Labels/Data/ngrams_AA/wsj/6grams_wsj_AA.txt", sep="\t", head=F)

names(wsj_abs) <- c("rank", "frq", "range", "token")
names(twp_abs) <- c("rank", "frq", "range", "token")
names(nyt_abs) <- c("rank", "frq", "range", "token")

names(wsj_rel) <- c("rank", "frq", "range", "token")
names(twp_rel) <- c("rank", "frq", "range", "token")
names(nyt_rel) <- c("rank", "frq", "range", "token")

wsj_abs$range <- NULL
twp_abs$range <- NULL
nyt_abs$range <- NULL
wsj_abs$rank <- NULL
twp_abs$rank <- NULL
nyt_abs$rank <- NULL

wsj_abs <- wsj_abs[ , c("token", "frq")]
twp_abs <- twp_abs[ , c("token", "frq")]
nyt_abs <- nyt_abs[ , c("token", "frq")]

wsj_rel$range <- NULL
twp_rel$range <- NULL
nyt_rel$range <- NULL
wsj_rel$rank <- NULL
twp_rel$rank <- NULL
nyt_rel$rank <- NULL

wsj_rel$relfrq <- wsj_rel$frq / sum(wsj_rel$frq)
twp_rel$relfrq <- twp_rel$frq / sum(twp_rel$frq)
nyt_rel$relfrq <- nyt_rel$frq / sum(nyt_rel$frq)

wsj_rel$frq <- NULL
twp_rel$frq <- NULL
nyt_rel$frq <- NULL


mydata1 <- merge(wsj_abs, twp_abs, by="token", all=T)
mydata_abs <- merge(mydata1, nyt_abs, by="token", all=T)
mydata_abs[is.na(mydata_abs)] <- 0.0

mydata2 <- merge(wsj_rel, twp_rel, by="token", all=T)
mydata_rel <- merge(mydata2, nyt_rel, by="token", all=T)
mydata_rel[is.na(mydata_rel)] <- 0.0

ed <- function(v1, v2) 
{
  sqrt( sum( (v1 - v2)^2 ) )
}

names(mydata_abs) <- c("token", "wsj", "twp", "nyt")
names(mydata_rel) <- c("token", "wsj", "twp", "nyt")

magnitude <- function(v){
  sqrt( dotProduct(v, v))
}

cosSim <- function(v1, v2){
  dotProduct(v1, v2)/ (magnitude(v1)*magnitude(v2))
}
  
euclidean_distance_1_2 <- ed(mydata_rel$wsj, mydata_rel$twp)
cor_1_2 <- cor.test(mydata_abs$wsj, mydata_abs$twp)
#cos_1_2 <- cosSim(mydata_abs$wsj, mydata_abs$twp)
euclidean_distance_1_3 <- ed(mydata_rel$wsj, mydata_rel$nyt)
cor_1_3 <- cor.test(mydata_abs$wsj, mydata_abs$nyt)
#cos_1_3 <- cosSim(mydata_abs$wsj, mydata_abs$nyt)
euclidean_distance_2_3 <- ed(mydata_rel$twp, mydata_rel$nyt)
cor_2_3 <- cor.test(mydata_abs$twp, mydata_abs$nyt)
#cos_2_3 <- cosSim(mydata_abs$twp, mydata_abs$nyt)

#corrgram()

print("ed_rel: wsj - twp")
print(euclidean_distance_1_2) # wsj - twp
print("ed_rel: wsj - nyt")
print(euclidean_distance_1_3) # wsj - nyt
print("ed_rel: twp - nyt")
print(euclidean_distance_2_3) # twp - nyt

print("cor_abs: wsj - twp")
print(cor_1_2) # wsj - twp
print("cor_abs: wsj - nyt")
print(cor_1_3) # wsj - nyt
print("cor_abs: twp - nyt")
print(cor_2_3) # twp - nyt


#print("cors_abs: wsj - twp")
#print(cos_1_2) # wsj - twp
#print("cos_abs: wsj - nyt")
#print(cos_1_3) # wsj - nyt
#print("cos_abs: twp - nyt")
#print(cos_2_3) # twp - nyt

mydata_abs$token <- NULL
mydata_rel$token <- NULL

#Naive Bayes Statistics:
#tokens <- c("black", "blacks", "African American", "African-American", "white", "whites", "police", "minority", "color", "unarmed")
#tokens <- c("color")
tokens <- c("unarmed black")
#tokens <- c("shooting", "unarmed", "africanamerican", "teenager")
#tokens <- c("color")

getProbV <- function(toks, probs) {
  result <- c()
  for (i in toks) {
    tok <- paste("^", i, "$", sep="");
    val <- probs$relfrq[ grep( tok, probs$token) ];
    if (length(val)) {
      result[i] <- val
    } else {
      result[i] <- 0.0000001
    }
  }
  return(result)
}

getSumOfLogs <- function(someVector) {
  return( sum(log(someVector)) )
}


# first value: sum of logs for the probabilities from nyt
print("NB_classifier based on 'unarmed black': nyt")
print( getSumOfLogs( getProbV(tokens, nyt_rel) ) )

# second value: sum of logs for the probabilities from twp
print("NB: twp")
print( getSumOfLogs( getProbV(tokens, twp_rel) ) )

# third value: sum of logs for the probabilities from wsj
print("NB: wsj")
print( getSumOfLogs( getProbV(tokens, wsj_rel) ) )


# cluster the documents
# first transpose the table such that the documents
# are rows, and token frequencies the columns

#simple working cluser
km_tran <- t(as.matrix(mydata_abs))
km <- kmeans(km_tran, centers=2)#$cluster
print(km)
#plotcluster(mydata_abs, km$cluster)

#K-nearest neighbor attempt
#abs_knn <- t(as.matrix(mydata_abs))
#m <- dim(mydata_abs)[1]
#val <- sample(1:m, size = round(m/3), replace = FALSE, 
#              prob = rep(1/m, m)) 
#mydata_abs.learn <- mydata_abs[-val,]
#mydata_abs.valid <- mydata_abs[val,]
#mydata_abs.kknn <- kknn(token~., mydata_abs.learn, mydata_abs.valid, distance = 1,
#                  kernel = "triangular")
#summary(mydata_abs.kknn)
#fit <- fitted(mydata_abs.kknn)
#table(mydata_abs.valid$Species, fit)
#pcol <- as.character(as.numeric(mydata_abs.valid$Species))
#pairs(mydata_abs.valid[1:4], pch = pcol, col = c("green3", "red")
#      [(mydata_abs.valid$Species != fit)+1])