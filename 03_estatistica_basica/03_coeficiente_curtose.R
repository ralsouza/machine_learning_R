##### Coeficiente de Assimetria #####

# O coeficiente de curtose é uma medida que caracteriza o achatamento da curva da função de distribuição.

# Exemplo: Os seguintes dados representam o número de acidentes diários em um complexo industrial 
# (colocados em ordem crescente), durante o período de 50 dias. Represente o histograma desses dados.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

hist(dados, main = "Número de Acidentes Diários", xlab = "Acidentes", ylab = "Frequência")

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
?kurtosis

ck = kurtosis(dados)
print(ck)

# CK ≈ 0: Distribuição normal. Chamada de Curtose Mesocúrtica.
# CK < 0: Cauda mais leve que a normal. Para um coeficiente de Curtose negativo, tem-se uma Curtose Platicúrtica.
# CK > 0: Cauda mais pesada que a normal. Para um coeficiente de Curtose positivo, tem-se uma Curtose Leptocúrtica.

# O coeficiente de curtose é igual a 2.37652. Logo, como o valor de CK é maior que 0, a curva é Leptocúrtica.

# Outro exemplo
n.sample <- rnorm(n = 10000, mean = 55, sd = 4.5)

# Skewness e Kurtosis
skewness(n.sample)
kurtosis(n.sample)

# Histograma com GGPLOT2
install.packages('ggplot2')
library(ggplot2)

datasim <- data.frame(n.sample)

ggplot(datasim, aes(x = n.sample), binwidth = 2) +
  geom_histogram(aes(y = ..density..), fill = 'red', alpha = 0.5) +
  geom_density(colour = 'blue') +
  xlab(expression(bold('Dados'))) +
  ylab(expression(bold('Densidade')))
