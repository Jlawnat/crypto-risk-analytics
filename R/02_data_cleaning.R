crypto_prices <- merge(BTC, ETH, SOL, BNB)
colnames(crypto_prices) <- c("BTC", "ETH", "SOL", "BNB")
crypto_prices=na.omit(crypto_prices)
log_returns =na.omit(diff(log(crypto_prices)))
