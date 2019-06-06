# Exemplo de como encontrar o melhor número de clusters
# Tutorial: https://www.r-bloggers.com/finding-optimal-number-of-clusters/
# Dataset: https://archive.ics.uci.edu/ml/datasets/ser+Knowledge+Modeling+Data+(Students'+Knowledge+Levels+on+DC+Electrical+Machines)

#### 1. Setup ####
# Diretório de Trabalho
setwd('/home/ralsouza/Documents/r_projects/machine_learning_R/04_machine_learning')

# Bibliotecas
#install.packages('readr')
library(readr)
library(tibble)
library(readr)

### 2. Carga do Dataset ####
?read.csv
ds_SKD <- read_csv( 'StudentKnowledgeData.csv'
                   ,col_types = cols(
                       STG = col_double()
                      ,SCG = col_double()
                      ,STR = col_double()
                      ,LPR = col_double()
                      ,PEG = col_double()
                      ,UNS = col_character()
                    )
                   )
head(ds_SKD)
summary(ds_SKD)
str(ds_SKD)

#### 3. Pré-Processamento ####
# Converter Data Frame para Tibble
?as_tibble
ds_SKD <- as_tibble(ds_SKD)

# Converter Dados Numéricos para Números
as_tibble(ds_SKD)

# Dimensão do Dataset
dim(ds_SKD)

# Validar Dados NA
is.na(ds_SKD)

# Escalar Dados
?scale
ds_SKD_scaled <- as.matrix(scale(ds_SKD))






