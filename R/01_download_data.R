library(quantmod)
BTC <- Ad(getSymbols("BTC-USD",
                     src = "yahoo",
                     from = "2020-01-01",
                     auto.assign = FALSE))
ETH <- Ad(getSymbols("ETH-USD",
                     src = "yahoo",
                     from = "2020-01-01",
                     auto.assign = FALSE))
SOL <- Ad(getSymbols("SOL-USD",
                     src = "yahoo",
                     from = "2020-01-01",
                     auto.assign = FALSE))
BNB <- Ad(getSymbols("BNB-USD",
                     src = "yahoo",
                     from = "2020-01-01",
                     auto.assign = FALSE))