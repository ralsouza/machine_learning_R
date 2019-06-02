# Solução Lista de Exercícios - Capítulo 12

#### 1. Setup Ambiente ####
# Diretório de Trabalho
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/04_machine_learning')
getwd()

# Pacotes
# Árvore de Decisão: Existem diversos pacotes, usaremos aqui o rpart
install.packages('rpart')
library(rpart)

# Visualização: Este pacote faz a visualização dos dados ficar mais legível
install.packages('rpart.plot')
library(rpart.plot)

# Dataset: Vamos utilizar um dataset que é disponibilizado junto com o pacote rpart
?kyphosis
str(kyphosis)
head(kyphosis)

# Exercício 1 - Depois de explorar o dataset, crie um modelo de árvore de decisão


# Para examinar o resultado de uma árvore de decisao, existem diversas funcões, mas você pode usar printcp()


# Visualizando a ávore (execute uma função para o plot e outra para o texto no plot)
# Utilize o zoom para visualizar melhor o gráfico
prp(arvore)