# a very simple implementation of a Naive Bayesian Classifier
# Define the "tokens" array with key words you would like to classify by

nyt <- read.table("~/Ethnic_Labels/Data/ngrams_AA/nyt/bigrams_twp_AA.txt", sep="\t")
twp <- read.table("~/Ethnic_Labels/Data/ngrams_AA/twp/bigrams_twp_AA.txt", sep="\t")
wsj <- read.table("~/Ethnic_Labels/Data/ngrams_AA/wsj/bigrams_twp_AA.txt", sep="\t")

names(nyt) <- c("token", "relfrq", "absfrq")
names(twp) <- c("token", "relfrq", "absfrq")
names(wsj) <- c("token", "relfrq", "absfrq")


# Change this array of tokens around to determine the test set of tokens.
tokens <- c("black", "blacks", "AfricanAmerican", "white", "whites", "police", "minority", "color", "unarmed")

# This function searches for a token the "tokens" array one by one
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
print("nyt")
print( getSumOfLogs( getProbV(tokens, nyt) ) )

# second value: sum of logs for the probabilities from twp
print("twp")
print( getSumOfLogs( getProbV(tokens, twp) ) )

# third value: sum of logs for the probabilities from wsj
print("wsj")
print( getSumOfLogs( getProbV(tokens, wsj) ) )

