#modelos da familia ARCH: pacote rugarch
#profa Andreza Palma

install.packages("BatchGetSymbols", dependencies = TRUE)
library(BatchGetSymbols)
library(rugarch)
library(tidyverse)
library(ggthemes)
library(FinTS)
library(WriteXLS)
library(xtable)
library(tbl2xts)

#para esta aula será usados os dados do IBOVESPA
tickers<-c("^BVSP")

ibov<- BatchGetSymbols(tickers,
                       first.date = '2019-03-21',
                       last.date = Sys.time(),
                       type.return = "log",
                       freq.data = "daily")

ibov <- ibov[[2]]


#selecionando os retornos diarios da serie do ibovespa
#e separando as datas da serie de retornos

daily_returns <- ibov %>% 
  select(ref.date,ret.closing.prices)

date <- daily_returns %>%
  select(ref.date) %>% 
  rename(date = ref.date) %>% 
  slice(-1)

daily_returns <- daily_returns %>%
  select(ret.closing.prices) %>% 
  slice(-1)
#testando efeito ARCH: teste LM

#teste LM para heterocedasticidade condicional para 1,2 e 10 defasagens. 

# a hipotese nula eh de que nao há efeito arch. Então,
#ao se rejeitar a hipotese nula, quer dizer q um modelo ARCH é ADEQUADO

ArchTest(daily_returns,lags=1,demean=TRUE)
ArchTest(daily_returns,lags=2,demean=TRUE)
ArchTest(daily_returns,lags=10,demean=TRUE)

#estimacao de modelos da familia arch

#primeiro é usado o comando ugarchspec 
#do pacote rugarch 
#que deleciona a configuracao dos modelos que serao estimados 

#para especificar a equacao da media, usa-se 
#mean.model = list(armaOrder=c(p,q))
#p = ordem da parte AR
#q = ordem da parte MA

#caso queria estimar o modelo GARCH-M
#archm = TRUE


#ESPECIFICANDO UM MODELO ARCH(1) 
#para a serie de retornos do IBOVESPA, sem um modelo para a media 

garch.spec = ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 0)), mean.model = list(armaOrder=c(0,0),include.mean = FALSE),
                        distribution.model = "std")
garch.fit = ugarchfit(spec=garch.spec, data=daily_returns)

#garch.fit permite estimar o modelo dizendo onde esta a configuracao(spec = garc.spec)

#verificando os resultados da estimacao 
garch.fit


#parametro de persistencia (soma dos termos AR e MA, ou seja, ARCH e GARCH)
persistence(garch.fit)

#criterios de informacao 

infocriteria(garch.fit)

#organizando os resultados em uma tabela e retornando o codigo para LaTeX
Table <- xtable(garch.fit@fit$matcoef)
print(Table, type = "latex", comment = FALSE)

#grafico da variancia condiiconal 

sigma <- sigma(garch.fit) %>% xts_tbl() 
colnames(sigma) <- c("date", "sigma") 
sigma <- sigma %>% mutate(date = as.Date(date))
ggplot(sigma) + geom_line(aes(x = date , y = sigma)) + theme_solarized()

#alguns graficos 
plot(garch.fit, which="all")

#ou para escolher qal grafico, basta colocar seu numero em which=""


#previsao para a volatibilidade atraves do modelo estimado
#a partir da funcao ugarchforecast 
#n.ahead significa quantos passos a frente queremos a previsao 

garchf.1 = ugarchforecast(garch.fit,n.ahead=10)
garchf.1

#possivel analisar graficamente 
p1 = plot(garchf.1,which=1)
p1

p2=plot(garchf.1,which=3)
p2