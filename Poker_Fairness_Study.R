cardDeck <- c("AH", "1H", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH",
              "AS", "1S", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS",
              "AC", "1C", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC",
              "AD", "1D", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD")

deal <- function(cardDeck) {
  handDealt <- paste(sample(cardDeck, 2, replace=FALSE))
  handDealt
}

n = 10000
cardsDealt <- replicate(n, deal(cardDeck))

handsTotal <- data.frame(t(cardsDealt))
names(handsTotal)[1] <- paste("cardOne")
names(handsTotal)[2] <- paste("cardTwo")



