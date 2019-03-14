# Distribuição Poisson

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd('/home/ralsouza/Documents/r_projects/machine_learning_R')
getwd()


# A Distribuição Poisson é muito útil para calcular a probabilidade de um certo número de eventos 
# que ocorrerá em um específico intervalo de tempo ou espaço. 

# Nós poderíamos usar este tipo de distribuição para determinar a probabilidade de 10 clientes 
# entrarem em uma loja nos próximos 30 minutos ou a probabilidade de 2 acidentes de carro ocorrerem 
# em um determinado cruzamento no próximo mês. 

# A Distribuição Poisson é um modelo para o número de eventos observados numa unidade de tempo ou de espaço, 
# dado que a taxa de eventos por unidade é constante e os eventos ocorrem de modo independente. 

# O único parâmetro da Poisson é λ (lambda), que representa a taxa de eventos por unidade.

# Se um certo número de objetos está distribuído ao acaso por uma área, e esta área é dividida em quadrículas de 
# mesmo tamanho, o número de objetos por quadrículas pode ser descrito por uma Distribuição Poisson. Neste caso, 
# o parâmetro λ será o total de objetos dividido pelo total de quadrículas.

# Distribuição Binomial, o número de sucessos observados é limitado ao número de possibilidades. 
# Distribuição Poisson, o número de resultados pode ser qualquer um.

# A Distribuição Poisson não conta o número de sucessos, como na distribuição binomial.
# A Distribuição Poisson conta o número de ocorrências de um evento particular sobre um intervalo 
# específico de tempo ou espaço. 

# A distribuição Poisson é muito útil quando quando se tem limites dentro da execução do experimento.

# Exemplo: Considere um processo que têm uma taxa de 0,5 defeitos por unidade. 
# Qual a probabilidade de uma unidade apresentar dois defeitos? E nenhum defeito?
?dpois

# Probabilidade de 2 defeitos
dpois(2, 0.5)

# Probabilidade de nenhum defeito
dpois(0, 0.5)









