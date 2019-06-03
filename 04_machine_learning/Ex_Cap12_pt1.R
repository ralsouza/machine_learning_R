# Lista I de Exercícios - Capítulo 12

#### 1. Setup Ambiente ####
# Diretório de Trabalho
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/04_machine_learning')
getwd()

# Pacotes
# Árvore de Decisão: Existem diversos pacotes, usaremos aqui o rpart
install.packages('rpart')
library(rpart)
?rpart

# Visualização: Estes pacotes fazem a visualização dos dados ficar mais legível
install.packages('rpart.plot')
library(rpart.plot)
?rpart.plot

install.packages('rattle')
library(rattle)
?fancyRpartPlot

# Dataset: Vamos utilizar um dataset que é disponibilizado junto com o pacote rpart
?kyphosis
str(kyphosis)
head(kyphosis)
summary(kyphosis)

##### Exercício - Depois de explorar o dataset, crie um modelo de árvore de decisão ####
# Método class para problemas de classificação
# Método anova para problemas de regressão
modelo_v1 <- rpart(Kyphosis ~., data = kyphosis, method = 'class')
summary(modelo_v1)

modelo_v2 <- rpart(Kyphosis ~ Age + Start, data = kyphosis, method = 'class')
summary(modelo_v2)

# Para examinar o resultado de uma árvore de decisão, existem diversas funções, 
# mas você pode usar printcp()
printcp(modelo_v1)

# Visualizando a ávore (execute uma função para o plot e outra para o texto no plot)
# Utilize o zoom para visualizar melhor o gráfico
plot(modelo_v1)
text(modelo_v1, use.n = TRUE)

# Usando a biblioteca Rattle
?fancyRpartPlot
fancyRpartPlot(modelo_v1, main = 'Kyphosis Analysis (modelo_v1)')
fancyRpartPlot(modelo_v2, main = 'Kyphosis Analysis (modelo_v2)')

# Usando o pacote rpart.plot
?rpart.plot
rpart.plot(modelo_v2)
