setwd('/home/ralsouza/Documents/r_projects/machine_learning_R')
getwd()

#### COEFICIENTE DE ASSIMETRIA (SKEWNESS) ####

# O coeficiente de assimetria é o que permite dizer se uma determinada distribuição é assimétrica ou não.

# Exemplo: Os seguintes dados representam o número de acidentes diários em um complexo industrial 
# (colocados em ordem crescente), durante o período de 50 dias. Represente o histograma desses dados.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

hist(dados, main = 'Número de Acidentes Diários', xlab = 'Acidentes', ylab = 'Frequência')

# Verificando no gráfico é possível verificar que a distriuição na esquerda e na direita não estão simetricas. É sempre importante calcular
# o Coeficiente de Assimetria, mesmo que o gráfico pareça simetrico.

# Abaixo podemos analisar a média, desvio padrão e mediana. Já é possível verificar que estes dados não são suficientes.
mean(dados)
sd(dados)
median(dados)

# Sendo assim é importante visualizar a distribuição com o histograma e calcular o Coeficiente de Assimetria
# É necessário usar a função Skewness do pacote Moments
install.packages('moments')
library(moments)
?skewness

sk = skewness(dados)
print(sk)

# Sk ≈ 0: dados simétricos. Tanto a cauda do lado direito quanto a do lado esquerdo da função densidade de probabilidade são iguais.
# Sk < 0: assimetria negativa. A cauda do lado esquerdo da função densidade de probabilidade é maior que a do lado direito.
# Sk > 0: assimetria positiva. A cauda do lado direito da função densidade de probabilidade é maior que a do lado esquerdo.

# O coeficiente de assimetria é 0.2549279. 
# Como o coeficiente de assimetria é maior que 0, diz-se que a curva apresenta assimetria positiva 
# e a cauda do lado direito da função densidade de probabilidade é maior que no lado esquerdo. 
# Ao observar também o Histograma, percebe-se que há maior densidade de dados do lado direito.

# Outro exemplo
set.seed(1234)
x = rnorm(1000)
hist(x)
skewness(x)
