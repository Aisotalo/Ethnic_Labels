nyt <- read.table(file="/home/tripdubz/EMU/EMU_GRADUATE/WINTER_2015/DISCOURSE/FINAL/DATA/Articles/Totals/nyt/bigram_nyt_f2.txt", sep="\t", head=F)
twp <- read.table(file="/home/tripdubz/EMU/EMU_GRADUATE/WINTER_2015/DISCOURSE/FINAL/DATA/Articles/Totals/twp/bigram_twp_f2.txt", sep="\t", head=F)
wsj  <- read.table(file="/home/tripdubz/EMU/EMU_GRADUATE/WINTER_2015/DISCOURSE/FINAL/DATA/Articles/Totals/wsj/bigram_wsj_f2.txt", sep="\t", head=F)

names(wsj) <- c("rank", "frq", "range", "token")
names(twp) <- c("rank", "frq", "range", "token")
names(nyt) <- c("rank", "frq", "range", "token")

wsj$range <- NULL
twp$range <- NULL
nyt$range <- NULL
wsj$rank <- NULL
twp$rank <- NULL
nyt$rank <- NULL

wsj$relfrq <- wsj$frq / sum(wsj$frq)
twp$relfrq <- twp$frq / sum(twp$frq)
nyt$relfrq <- nyt$frq / sum(nyt$frq)

wsj$frq <- NULL
twp$frq <- NULL
nyt$frq <- NULL

mydata1 <- merge(wsj, twp, by="token", all=T)
mydata <- merge(mydata1, nyt, by="token", all=T)

mydata[is.na(mydata)] <- 0.0

names(mydata) <- c("bigram", "wsj", "twp", "nyt")

tokens <- c("unarmed black")

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

magnitude <- function(v){
  sqrt( dotProduct(v, v))
}

cosSim <- function(v1, v2){
  dotProduct(v1, v2)/ (magnitude(v1)*magnitude(v2))
}


# first value: sum of logs for the probabilities from nyt
print("nyt")
print( getSumOfLogs( getProbV(tokens, nyt) ) )

# second value: sum of logs for the probabilities from twp
print("twp")
print( getSumOfLogs( getProbV(tokens, twp) ) )

# third value: sum of logs for the probabilities from wsj
print("wsj")
print( getSumOfLogs( getProbV(tokens, wsj) ) )

print("correlation coefficient: wsj - twp")
cor(mydata$wsj, mydata$twp)
print("correlation coefficient: wsj - nyt")
cor(mydata$wsj, mydata$nyt)
print("correlation coefficient: twp - nyt")
cor(mydata$twp, mydata$nyt)
