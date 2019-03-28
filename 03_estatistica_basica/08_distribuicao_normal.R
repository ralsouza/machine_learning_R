# Distribuição Normal

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd('/home/ralsouza/Documents/r_projects/machine_learning_R')
getwd()


# A Distribuição Normal, ou Gaussiana, é a mais importante distribuição contínua. 
# Isso por conta de vários fatores, entre eles, o teorema central do limite, o qual é um resultado essencial 
# em aplicações práticas e teóricas, pois garante que, mesmo que os dados não sejam distribuídos segundo uma normal, 
# a média dos dados converge para uma distribuição normal conforme o número de dados aumenta.

# O R inclui funcionalidades para operações com distribuições de probabilidades. 
# Para cada distribuição há 4 operações básicas indicadas pelas letras:

# d: calcula a densidade de probabilidade f(x) no ponto
# p: calcula a função de probabilidade acumulada F(x) no ponto
# q: calcula o quantil correspondente a uma dada probabilidade
# r: retira uma amostra da distribuição

# Para utlizar as funções combina-se uma das letras acima com uma abreviatura do nome da distribuição. 
# Por exemplo, para calcular probabilidades usamos: pnorm para normal, pexp para exponencial, 
# pbinom para binomial, ppois para Poisson e assim por diante.

# x <- rnorm(n, mean, sd)
# Onde n é o tamanho da amostra e mean e sd são parâmetros opcionais relacionados à média e desvio padrão, 
# respectivamente.

# Distribuição Normal
?rnorm
x <- rnorm(100)
hist(x)

# Densidade
# # Observe que o gráfico gerado assemelha-se a uma Gaussiana e não apresenta assimentria. 
# Quando o gráfico da distribuição possui tal forma, há grandes chances de se tratar de uma distribuição normal.
x <- seq(-6, 6, by=0.01)
print(x)
y <- dnorm(x)
plot(x, y, type="l")























