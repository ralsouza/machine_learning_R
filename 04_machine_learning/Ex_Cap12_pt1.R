# Solução Lista de Exercícios - Capítulo 12

#### 1. Setup Ambiente ####
# Diretório de Trabalho
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/04_machine_learning')
getwd()

# Pacotes
# Árvore de Decisão: Existem diversos pacotes, usaremos aqui o rpart
install.packages('rpart')
library(rpart)
?rpart

# Visualização: Este pacote faz a visualização dos dados ficar mais legível
install.packages('rpart.plot')
library(rpart.plot)
?rpart.plot

# Dataset: Vamos utilizar um dataset que é disponibilizado junto com o pacote rpart
?kyphosis
str(kyphosis)
head(kyphosis)
summary(kyphosis)

##### Exercício - Depois de explorar o dataset, crie um modelo de árvore de decisão ####
modelo_v1 <- rpart(Kyphosis ~., data = kyphosis)
summary(modelo_v1)

# Para examinar o resultado de uma árvore de decisão, existem diversas funções, 
# mas você pode usar printcp()
printcp(modelo_v1)

# Visualizando a ávore (execute uma função para o plot e outra para o texto no plot)
# Utilize o zoom para visualizar melhor o gráfico
prp(modelo_v1)