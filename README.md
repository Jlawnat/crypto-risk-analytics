# Crypto Risk Analytics & Forecasting System

## Project Overview

This project develops an automated cryptocurrency forecasting and risk analytics system in R.

The system downloads the latest market data directly from Yahoo Finance, preprocesses historical prices, selects appropriate time-series models, forecasts future returns and volatility, estimates Value-at-Risk (VaR), and generates professional reports automatically.

Rather than analysing a single cryptocurrency, the framework is designed to monitor multiple digital assets continuously and provide an up-to-date assessment of market risk.
Currently the project analyses:

- Bitcoin (BTC)
- Ethereum (ETH)
- Solana (SOL)
- Binance Coin (BNB)

The project is fully reproducible and can be updated automatically as new market data become available.

## Research objectives
To develop an automated forecasting framework that continuously evaluates cryptocurrency market risk using modern financial econometric models.

The project aims to answer:

- How can cryptocurrency returns and volatility be forecast automatically?
- Which volatility model provides the best forecasting performance?
- How does market risk evolve over time?
- How much capital is required to protect against extreme downside risk?
- 
## Features
Automatic data download from Yahoo Finance

 Automatic data cleaning

 Log return calculation

 Exploratory data analysis

 Stationarity testing (ADF)

 ARCH effect detection

 ARMA model selection

 Volatility modelling

- GARCH(1,1)
- EGARCH
- GJR-GARCH

 Rolling volatility forecasting

 Value-at-Risk estimation

 Forecast evaluation

 Automatic report generation

## project workflow
1. Download cryptocurrency prices

2. Clean and preprocess data

3. Compute log returns

4. Perform statistical analysis

5. Test stationarity

6. Select forecasting models

7. Estimate volatility models

8. Produce forecasts

9. Calculate Value-at-Risk

10. Generate figures and summary reports

## models

The project currently implements

- ARMA
- GARCH(1,1)
- EGARCH
- GJR-GARCH

Additional models will be added as the project develops.

## Future Development

Future versions of the project will include

- Automatic model selection

- Rolling-window forecasting

- Daily automatic updates

- Email notifications

- Interactive dashboard

- Forecast performance comparison

- Portfolio risk optimisation

## Author

Elliot Yang
