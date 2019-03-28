setwd('/home/ralsouza/Documents/r_projects/machine_learning_R')
getwd()

#### HISTOGRAMA ####

# Um histograma é um modelo de gráfico que representa uma distribuição de frequências 
# através de um agrupamento de classes, de forma que se pode contabilizar as ocorrências dos 
# dados em cada classe. 

# Possibilita visualizar a distribuição de medidas, a dispersão, simetria dos dados e tendências centrais.

# Os conceitos de Frequência Absoluta e Frequência Relativa são importantes na construção de um histograma. 

# Por frequência absoluta, entende-se o número de observações correspondente a cada classe. 

# A frequência relativa, por sua vez, diz respeito ao quociente entre a frequência absoluta da classe 
# correspondente e a soma das frequências absolutas. 

# A soma das áreas de todos os retângulos do histograma deve ser igual a 1.

# Como fazer um histograma manualmente?

# 1- Ordenar os valores
# 2- Encontrar a amplitude total: A = xmax − xmin. Assim, os intervalos devem cobrir uma faixa de, no mínimo, o valor da amplitude.
# 3- Estimar o número de classes: 2k ≤ n. Sendo que n é igual a raiz quadrada do número total de observações.
# 4- Estimar o tamanho de cada intervalo de classe: C = A/k
# 5- Contar o número de observações que caem em cada intervalo de classe (subintervalo), frequência.
# 6- Determinar a frequência relativa do intervalo: Frequência relativa = frequência/total de observações.
# 7- Construir o gráfico.

# Exemplo: Os seguintes dados representam o número de acidentes diários em um complexo industrial 
# (colocados em ordem crescente), durante o período de 50 dias. Represente o histograma desses dados.
dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

hist(dados, main = 'Número de Acidentes Diários', xlab = 'Acidentes', ylab = 'Frequência')
hist(dados, main = 'Número de Acidentes Diários', xlab = 'Acidentes', ylab = 'Frequência', breaks = 6)
# O interpretador verifica que 6 breaks é o mínimo e ao reduzir para 5 o gráfico mantém com 6 bins
hist(dados, main = 'Número de Acidentes Diários', xlab = 'Acidentes', ylab = 'Frequência', breaks = 5)
?hist
