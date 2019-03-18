## Exercícios de Estatística
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R')

# 1 - Gere 1000 números de uma distribuição normal com média 3 e sd = .25 e grave no objeto chamado x.
?rnorm
x <- rnorm(1000, mean = 3, sd = 0.25)
print(x)

# 2 - Crie o histograma dos dados gerados no item anterior e adicione uma camada com a curva da normal.

# Verificar o coeficiente de simetria
install.packages('moments')
library(moments)
skewness(x)

?hist
?curve
?text
?round

# Histograma com a distribuição normal, dividido em 20 bins
hist( x
     ,main = 'Histograma de Distribuição Normal'
     ,xlab = 'Valores de X' ,ylab = 'Valores de Y'
     ,col  = 'lightgray'
     ,prob = TRUE
     ,ylim = c(0, 1.80)
     ,breaks = 20)

# Adição da curva normal através da função de densidade de probabilidade e adicionando a camada ao histograma
curve( dnorm(x, mean = 3, sd = 0.25)
      ,add = TRUE
      ,col = 'red')

# Inclusão da informação do Coefiente de Assimetria
text(x = 2.2, y = 1, labels = paste('Skewness = ',round(skewness(x),7)))

# Impressão do plot em um arquivo de imagem
png(filename = 'histograma_distribuicao_normal_exercicio_1.png')
# Rodar o plot antes de fechar o arquivo
dev.off()

# 3 - Suponha que 80% dos adultos com alergias relatem alívio sintomático com uma medicação específica. 
# Se o medicamento é dado a 10 novos pacientes com alergias, qual é a probabilidade de que ele seja 
# eficaz em exatamente sete?

# Esta questão pode ser resolvida com Distribuição Binomial
# x = Probabilidade eficácia, 7 pacientes
# p = 0.08, percentual de pacientes que relataram alívio na experiência anterior
# n = 10, número total de pacientes na experiência atual
# dbinom(x, n, p)

dbinom(7, 10, 0.8)
# Reposta: A probabilidade que a medicação seja eficaz em exatamente sete pacientes é de 20,13%.

# Medindo a Distribuição de Probabilidades
graph <- function(n,p){
  x <- dbinom(0:n, size = n, prob = p)
  barplot(x, ylim = c(0,1), names.arg = 0:n,
          main = sprintf(paste('Distribuição Binomial (n,p)', n, p, sep = ',')))
}
graph(10,0.8)

# 4 - Suponha que os resultados dos testes de um vestibular se ajustem a uma distribuição normal. 
# Além disso, a pontuação média do teste é de 72 e o desvio padrão é de 15,2. 
# Qual é a porcentagem de alunos que pontuaram 84 ou mais no exame?

# Média: 72
# Desvio Padrão: 15.2
# Nota: >= 84
# Como precisamos analisar as notas dos alunos que tiraram a nota igual ou superior à 84, 
# estamos interessados na cauda superior da distribuição normal.
pnorm(84, mean = 72, sd = 15.2, lower.tail = FALSE)

# 5 - Suponha que o tempo médio de check-out de um caixa de supermercado seja de três minutos. 
# Encontre a probabilidade de um check-out do cliente ser concluído pelo caixa em menos de dois minutos.

# Média por checkout: 3 min.
# Taxa de Processamento: 1/3
# Probabilidade de conclusão: <= 2 min.
# A taxa de processamento de checkout é igual a uma dividida pelo tempo médio de conclusão da finalização, logo, 1/3
# Por isso, a taxa de processamento é 1/3 de checkouts por minuto
# Em seguida, aplicamos a função pexp da distribuição exponencial com taxa = 1/3
# Neste cenário onde se reduz a taxa de processamento à medida que se reduz o tempo, se aplica uma distribuição exponencial
?pexp
pexp(2, rate  = 1/3)

# 6 - Selecione dez números aleatórios entre um e três.
# Aplicamos a função de geração runif da distribuição uniforme para gerar dez números aleatórios entre um e três.
?runif
runif(10, min = 1, max = 3)

# 7 - Se houver 12 carros atravessando uma ponte por minuto, em média, 
# encontre a probabilidade de ter 15 ou mais carros cruzando a ponte em um determinado minuto.
# A probabilidade de ter 14 ou menos carros atravessando a ponte em um determinado minuto é dada pela função ppois
# Como a pergunda é sobre 14 carros ou menos, calculamos a cauda inferior

# Lambda = 12
?ppois
ppois(14, lambda = 12) # lower tail

# Desta forma, a probabilidade de ter 15 ou mais carros cruzando a ponte em um minuto está na 
# cauda superior da função de densidade de probabilidade
ppois(15, lambda = 12, lower.tail = FALSE) # upper tail


# 8 - Suponha que haja 12 questões de múltipla escolha em um questionário de inglês. 
# Cada questão tem cinco respostas possíveis e apenas uma delas está correta. 
# Encontre a probabilidade de ter quatro ou menos respostas corretas se um aluno tentar 
# responder a cada pergunta aleatoriamente.