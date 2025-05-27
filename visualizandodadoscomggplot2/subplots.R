# aula da prof Andreza palma
# explorando dados de um conjunto de dados mpg do R

# Carregar pacotes (instale se necessário)
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

data(mpg)
head(mpg)
tail(mpg)
summary(mpg)

# fazendo um grafico de dispersao entre variaveis disponiveis
# displ (tamanho do motor de um carro em litros)
# hwy (eficiencia do combustivel de um carro na estrada em milhas por galao)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))    # [Corrigido: usar y = hwy em vez de y - hwy]

# o grafico mostra uma possivel relacao negativa entre as var analisados
# temos um conjunto de pontos discrepantes, fazemos uma reta para verificar 
# aes() esta sendo usado diretamente na funcao ggplot(), é aplicado a todos os objetos geometricos
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +   # [Corrigido: mapping correto]
  geom_point() +
  geom_smooth(method = "lm")

# diferenciando os pontos da variavel class por cores de acordo com a variavel 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# comando alpha = class para diferenciar as classes usando a transparencia dos pontos 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# ou diferenciando pelo formato dos pontos, com shape=class
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# é possivel dividir os graficos em FACETAS ou SUBPLOTS 
# facet_wrap cria subplots a partir de uma unica variavel, que deve ser discreta

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)    # nrow divide os subplots em duas linhas

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, ncol = 2)    # ncol = 2 divide em duas colunas

# CRIANDO FACETAS A PARTIR DE DUAS VARIAVEIS 
# facet_grid()
ggplot(data = mpg) +                 # [Corrigido: data em vez de 'fata']
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

# TEMAS
# theme() PERMITE MODIFICAR A APARENCIA DE UM GRAFICO 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl) +
  theme_light()

# MULTIPLOS GRAFICOS POR PAGINAS 
# gerar graficos independentes separados em subplots. 
# grid.arrange()
# eh necessario instalar e carregar o pacote gridExtra
if (!require(gridExtra)) install.packages("gridExtra")
library(gridExtra)

p1 <- ggplot(data = mpg, aes(x = displ)) +
  geom_bar(fill = "blue")

# Boxplot de displ: usar aes(y = displ) para boxplot vertical
p2 <- ggplot(data = mpg, aes(y = displ)) +  # [Corrigido: adicionar y]
  geom_boxplot()

p3 <- ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "red")

grid.arrange(p1, p2, p3, ncol = 2)
