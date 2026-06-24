# crypto-risk-analytics

## Project Overview

Cryptocurrencies are among the most volatile financial assets in modern markets. Understanding their risk characteristics is essential for investors, portfolio managers, and financial institutions.

This project analyses the volatility dynamics and downside risk of five major cryptocurrencies using advanced financial econometric models. The study compares volatility persistence, asymmetric shock responses, and Value-at-Risk measures to identify which cryptocurrency exhibits the greatest market risk.
The cryptocurrencies analysed are:

- Bitcoin (BTC)
- Ethereum (ETH)
- Solana (SOL)
- Binance Coin (BNB)

## Research Question

Which cryptocurrency exhibits the highest volatility persistence, strongest response to adverse market shocks, and greatest downside risk?

## Methods

- Data collection from Yahoo Finance
- Log return calculation
- Descriptive statistical analysis
- Stationarity testing using the Augmented Dickey-Fuller (ADF) test
- ARCH effect testing
- GARCH(1,1) volatility modelling
- GJR-GARCH(1,1) asymmetric volatility modelling
- EGARCH(1,1) volatility modelling
- Volatility persistence comparison
- Value-at-Risk (VaR) estimation
- Volatility forecasting and risk ranking
## Tools

- R
- Quarto
- quantmod
- rugarch
- tidyverse

## Expected Outcomes

The project identifies which cryptocurrency presents the highest level of market risk and evaluates whether negative shocks have a greater impact on volatility than positive shocks. The findings provide insights into cryptocurrency risk management and portfolio allocation decisions.

## Author

Elliot Yang
