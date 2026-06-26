crypto_prices <- merge(BTC, ETH, SOL, BNB)
colnames(crypto_prices) <- c("BTC", "ETH", "SOL", "BNB")
crypto_prices=na.omit(crypto_prices)
log_returns =na.omit(diff(log(crypto_prices)))
dir.create("data/processed", showWarnings = FALSE, recursive = TRUE)
log_returns_df <- data.frame(
  Date = index(log_returns),
  coredata(log_returns)
)

write_csv(
  log_returns_df,
  "data/processed/cleaned_returns.csv"
)


