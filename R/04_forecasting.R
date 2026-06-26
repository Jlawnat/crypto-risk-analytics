library(tidyverse)
library(rugarch)
library(readr)
returns <- read_csv("data/processed/cleaned_returns.csv")
best_models <- readRDS("outputs/models/best_models.rds")

split <- floor(0.8 * nrow(returns))
train <- returns[1:split, ]
test <- returns[(split + 1):nrow(returns), ]

spec_garch <- ugarchspec(
  variance.model = list(
    model = "sGARCH",
    garchOrder = c(1, 1)
  ),
  mean.model = list(
    armaOrder = c(0, 0),
    include.mean = TRUE
  ),
  distribution.model = "std"
)

spec_gjr <- ugarchspec(
  variance.model = list(
    model = "gjrGARCH",
    garchOrder = c(1, 1)
  ),
  mean.model = list(
    armaOrder = c(0, 0),
    include.mean = TRUE
  ),
  distribution.model = "std"
)

spec_egarch <- ugarchspec(
  variance.model = list(
    model = "eGARCH",
    garchOrder = c(1, 1)
  ),
  mean.model = list(
    armaOrder = c(0, 0),
    include.mean = TRUE
  ),
  distribution.model = "std"
)


forecast_results <- list()

for (coin in names(best_models)) {
  
  fit <- best_models[[coin]]
  
  forecast <- ugarchforecast(
    fit,
    n.ahead = nrow(test)
  )
  
  sigma_forecast <- as.numeric(sigma(forecast))
  mu_forecast <- as.numeric(fitted(forecast))
  forecast_results[[coin]] <- data.frame(
    Date = test$Date,
    Forecast_Volatility = sigma_forecast,
    Forecast_Return = mu_forecast
  )
  
}

accuracy_results <- data.frame()

var_results <- data.frame()

for (coin in names(forecast_results)) {
  
  realised_vol <- abs(test[[coin]])
  
  predicted_vol <- forecast_results[[coin]]$Forecast_Volatility
  
  rmse <- sqrt(mean((predicted_vol - realised_vol)^2))
  
  mae <- mean(abs(predicted_vol - realised_vol))
  
  forecast_results[[coin]]$VaR95 <-
    forecast_results[[coin]]$Forecast_Return -
    1.645 * predicted_vol
  
  forecast_results[[coin]]$VaR99 <-
    forecast_results[[coin]]$Forecast_Return -
    2.326 * predicted_vol
  
  accuracy_results <- rbind(
    accuracy_results,
    data.frame(
      Cryptocurrency = coin,
      RMSE = rmse,
      MAE = mae
    )
  )
  
  var_results <- rbind(
    var_results,
    data.frame(
      Cryptocurrency = coin,
      Mean_VaR95 = mean(forecast_results[[coin]]$VaR95),
      Mean_VaR99 = mean(forecast_results[[coin]]$VaR99)
    )
  )
}


dir.create("outputs/forecasts", showWarnings = FALSE, recursive = TRUE)
dir.create("outputs/tables", showWarnings = FALSE, recursive = TRUE)

# Save forecast for each cryptocurrency
for (coin in names(forecast_results)) {
  
  write_csv(
    forecast_results[[coin]],
    paste0("outputs/forecasts/", coin, "_forecast.csv")
  )
  
}

write_csv(
  accuracy_results,
  "outputs/tables/forecast_accuracy.csv"
)

write_csv(
  var_results,
  "outputs/tables/var_results.csv"
)

cat("\nForecasting completed successfully!\n")
cat("Forecast files saved in outputs/forecasts/\n")
cat("Summary tables saved in outputs/tables/\n")















































