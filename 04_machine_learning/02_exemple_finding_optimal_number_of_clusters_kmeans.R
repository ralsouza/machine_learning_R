# Exemplo de como encontrar o melhor número de clusters
# Tutorial: https://www.r-bloggers.com/finding-optimal-number-of-clusters/
# Dataset: https://archive.ics.uci.edu/ml/datasets/ser+Knowledge+Modeling+Data+(Students'+Knowledge+Levels+on+DC+Electrical+Machines)

#### 1. Setup ####
# Diretório de Trabalho
setwd('/home/ralsouza/Documents/r_projects/machine_learning_R/04_machine_learning')

# Bibliotecas
#install.packages('readr')
library(readr)

### 2. Dataset ####
# Renomeação do Arquivo
