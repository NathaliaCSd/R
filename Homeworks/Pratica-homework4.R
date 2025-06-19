# Parte Prática do homework 4

## 3. Obtenção de log-retornos


install.packages("BatchGetSymbols")
install.packages("rugarch")
install.packages("tidyverse")

library(purrr)
library(BatchGetSymbols)
library(rugarch)
library(tidyverse)

get_logret <- function(ticker){
  tmp <- BatchGetSymbols(
    ticker,
    first.date        = "2019-01-01",
    last.date         = Sys.Date(),
    type.return       = "log",
    freq.data         = "daily",
    do.complete.data  = FALSE
  )[[2]]
  tmp %>% 
    arrange(ref.date) %>% 
    pull(ret.adjusted.prices) %>% 
    na.omit()
}

length(ret_petr)   # deve ser >> 30
head(ret_petr)     # deve ser FALSE


ret_petr <- get_logret("PETR4.SA")
ret_ibov <- get_logret("^BVSP")

# especificação normal
spec_norm <- ugarchspec(
  variance.model    = list(model = "sGARCH", garchOrder = c(1,1)),
  mean.model        = list(armaOrder = c(0,0), include.mean = FALSE),
  distribution.model = "norm"
)

# especificação t-Student
spec_std <- ugarchspec(
  variance.model    = list(model = "sGARCH", garchOrder = c(1,1)),
  mean.model        = list(armaOrder = c(0,0), include.mean = FALSE),
  distribution.model = "std"
)

# ajustes
fit_petr_norm <- ugarchfit(spec_norm, ret_petr)
fit_petr_std  <- ugarchfit(spec_std,  ret_petr)
fit_ibov_norm <- ugarchfit(spec_norm, ret_ibov)
fit_ibov_std  <- ugarchfit(spec_std,  ret_ibov)

# Se ainda der warning de “no convergence”, tente trocar o solver:
fit_petr_norm <- ugarchfit(spec_norm, ret_petr,
                           solver = "solnp",
                           solver.control = list(trace = 0))


# coeficiente de persistência α+β
pers <- c(
  PETR_norm = persistence(fit_petr_norm),
  PETR_std  = persistence(fit_petr_std),
  IBOV_norm = persistence(fit_ibov_norm),
  IBOV_std  = persistence(fit_ibov_std)
)

half_life <- log(0.5) / log(unlist(pers))

tibble(
  Modelo       = names(pers),
  Persistência = pers,
  Half_Life    = half_life
)

#Persistência perto de 1:  choques duram muito tempo, volatilidade se autocorrre fortemente.

#Half-life indica em quantos dias o efeito de um choque inicial reduz-se à metade.