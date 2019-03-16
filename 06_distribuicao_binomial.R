# Distribuição Binomial - Para variáveis aleatórias discretas

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd('/home/ralsouza/Documents/r_projects/machine_learning_R')
getwd()


# Uma variável aleatória tem Distribuição Binomial quando o experimento ao 
# qual está relacionada apresenta apenas 2 resultados: sucesso e fracasso.

# Vamos imaginar que nosso experimento seja contar quantos clientes que entram em uma loja de celulares, 
# adquirem um plano pós-pago.

# Para este experimento, temos 2 possibilidades para cada observação: adquirir ou não adquirir o plano.

# Como podemos ter apenas 2 resultados possíveis, este é chamado um Experimento Binomial.

# Vamos imaginar agora, que historicamente, 10% dos clientes que entram na loja, adquirem um plano pós-pago.
# Portanto, a probabilidade de sucesso (que vamos chamar de p) para cada observação é 0.10.
# E a probabilidade de falha (que vamos chamar de q) para cada observação é 0.90. 

# Ou seja: p = 1 – q 

# p = probabilidade de sucesso
# q = probabilidade de fracasso 

# A palavra sucesso não tem relação com resultado positivo do experimento, assim como a palavra fracasso 
# não tem conotação negativa. 

# Outra característica da distribuição binomial, é que cada observação é independente das outras. 

# Dessa forma, um Experimento Binomial consiste de um número fixo de observações, 
# indicado por n e contamos o número de sucessos, indicado por x.

# A Média de uma Distribuição Binomial, representa a média de longo prazo de sucessos esperados, 
# baseado no número de observações.

# A Variância de uma Distribuição Binomial, representa a variação que existe no número de sucessos (p) 
# sobre um número (n) de observações.



# Exemplo: A probabilidade de um paciente com um ataque cardíaco morrer do ataque é de 0.04 
# (ou seja, 4 de 100 morrem do ataque). Suponha que tenhamos 5 pacientes que sofrem um ataque cardíaco, 
# qual é a probabilidade de que todos sobrevivam? 

# Para este exemplo, vamos chamar um sucesso um ataque fatal (p = 0.04). 
# Temos n = 5 pacientes e queremos saber a probabilidade de que todos sobrevivam ou, em outras palavras, 
# que nenhum seja fatal (0 sucessos).

# X = Número de sobreviventes ao ataque
# Sucesso ao ataque p = 0.04
# Total pacientes n = 5 
# dbinom(X, n, p)
?dbinom
dbinom(0, 5, 0.04)

# Desenhando a distribuição de probabilidade
graph <- function(n,p){
  x <- dbinom(0:n, size = n, prob = p)
  barplot(x, ylim = c(0,1), names.arg = 0:n,
          main = sprintf(paste('Distribuição Binomial (n,p)', n, p, sep = ',')))
}
graph(5,0.04)

# Criando o gráfico de uma distribuição binomial
x <- seq(0, 50, by = 1)
y <- dbinom(x, 50, 0.5)
png(file = 'dbinom.png')
plot(x,y)
dev.off()
















