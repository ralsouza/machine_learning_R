##### Covariância #####

# A covariância entre duas variáveis (X, Y) é uma medida de variabilidade conjunta dessas duas variáveis aleatórias. 
# Quando a covariâncias entre essas variáveis é positiva os dados apresentam tendência positiva na dispersão. 
# Quando o valor da covariância é negativo, o comportamento é análogo, no entanto, os dados apresentam tendências negativas. 

# Covariância é uma medida de como as alterações em uma variável estão associadas a mudanças em uma segunda variável. 
# Especificamente, a covariância mede o grau em que duas variáveis estão linearmente associadas. 
# No entanto, também é frequentemente usado informalmente como uma medida geral de como duas variáveis são 
# monotonicamente relacionadas.


##### Coeficiente de Correlação #####

# Correlação é uma versão em escala de covariância que assume valores em [−1,1] 
# com uma correlação de ± 1 indicando associação linear perfeita e 0 indicando nenhuma relação linear. 
# Esse escalonamento torna a correlação invariante às mudanças na escala das variáveis originais 
# A constante de escala é o produto dos desvios padrão das duas variáveis.

# Portanto, o Coeficiente de Correlação p mede o grau de correlação entre duas variáveis.

# Para p = 1, tem-se uma correlação perfeita entre as duas variáveis. 
# Se p = - 1, há uma correlação perfeita entre as variáveis, no entanto, essa correlação é negativa. 
# Caso p = 0, as duas variáveis não dependem linearmente uma da outra.

# Para p = -1 indica uma forte correlação negativa: isso significa que toda vez que x aumenta, y diminui 
# Para p = 0 significa que não há associação entre as duas variáveis (x e y) 
# Para p = 1 indica uma forte correlação positiva: isso significa que y aumenta com x 

# Exemplo: Analisar a covariância e correlação entre as variáveis milhas/galão e peso do veículo no dataset mtcars.

my_data <- mtcars

install.packages('ggpubr')
library(ggpubr)

ggscatter(my_data, x = 'mpg', y = 'wt', 
          add = 'reg.line', conf.int = TRUE, 
          cor.coef = TRUE, cor.method = 'pearson',
          xlab = 'Autonomia', ylab = 'Peso do Veículo')

# Definindo x e y
x = my_data$mpg
y = my_data$wt

# Covariância
?cov
cov(x, y)

# Correlação - É mais fácil de interpretar devido a escala de p
# Correlação não implica em causalidade: Logo não podemos afirmar que o peso do veículo é o responsável direto pela queda da automonia.
#                                        Para isso seria necessário estudar mais e buscar mais variáveis, realizar um experimento ou um estudo.
#                                        O que é mostrado é uma correlação é uma relação de causa, pois são coisas diferentes.
#                                        Nesta análise podemos interpretar que existe uma correlação a medida que aumenta o peso, diminui a economia.
#                                        Talvez não seja a única causa, poderia ser o tipo de combústivel, a forma que o motor foi regulado, tempo de vida do motor, estado de óleo do motor... uma série de outras questões.
#                                        É necessário buscar essas outras variáveis analisa-las e então tirar conclusões sobre causalidade.
#                                        E como são interpretações e suposições, é possível que nunca se chegue a causa do problema.
?cor
cor(x, y)