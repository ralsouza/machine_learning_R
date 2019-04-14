#### ANÁLISE EXPLORATÓRIA DE DADOS ####
# Usar este script como um modelo de ponto de partida para análises exploratórias no futuro

setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/04_machine_learning')

#### CARREGAR PACOTE READR ####
library(readr)

#### CARREGAR DATASET ####

# Checar especificações do readr para entender como importar os dados, mudando o tipo de dados apenas da
# coluna "ano" de numérico para carácter
vignette('readr')

# Checar os tipos de dados padrão especificados pelo readr antes de importar
readr::spec_csv('carros-usados.csv')

# Conforme na documentação do readr, é melhor prática especificar explicitamente os tipos de dados para 
# evitar problemas inesperados nos dados. Optamos por especificar explicitamente todas as colunas, invés
# de apenas a coluna "ano"
carros <- readr::read_csv('carros-usados.csv'
                          ,col_types = cols(
                              ano = col_character(),
                              modelo = col_character(),
                              preco = col_double(),
                              kilometragem = col_double(),
                              cor = col_character(),
                              transmissao = col_character()
                          )
                 )

# Renomear a coluna kilometragem para quilometragem
carros <- plyr::rename(carros, c('kilometragem' = 'quilometragem'))

# Exibir a especificação do data frame conforme nova especificação
readr::spec(carros)

#### RESUMO DOS DADOS  ####
attributes(carros)
View(carros)
str(carros)

#### MEDIDAS DE TENDÊNCIA CENTRAL ####
summary(carros$ano)
summary(carros[c('preco', 'kilometragem')])

#### ANÁLISE EXPLORATÓRIA PARA VARIÁVEIS NUMÉRICAS ####
mean(carros$preco)
median(carros$preco)
# Obs.: Os dados não estão em uma distribuição normal, pois a média e mediana tem valores diferentes

# Quartis
quantile(carros$preco)

# Percentis
quantile(carros$preco, probs = c(0.01, 0.50, 0.99))
quantile(carros$preco, seq(from = 0, to = 1, by = 0.20))

# Intervalo interquartil, diferença entre Q3 e Q1
IQR(carros$preco)

# Alcance dos dados
range(carros$preco)
diff(range(carros$preco))

# Plot dos dados
# Usamos boxplot e histogramas para análise de dados univariada
# Boxplot - Leitura de baixo para cima  - Q1, Q2, Mediana e Q3
boxplot(carros$preco, main = 'Boxplot para Preços de Carros Usados', ylab = 'Preço (R$)')
boxplot(carros$quilometragem, main = 'Boxplot para Quilometragem de Carros Usados,', ylab = 'Quilometragem (Km)')
# Obs.: Podemos verificar nas "bolinhas", os outliers máximos e mínimos

# Histograma - Indicam a frequência de valores dentro de cada bin (classe de valores)
hist(carros$preco, main = 'Histograma para Valores de Carros Usados', ylab = 'Preço (R$)')
hist(carros$quilometragem, main = 'Histograma para Quilometragem de carros Usados', ylab = 'Quilometragem (Km)')
# Reduzindo os bins para visualizar um pouco melhor os dados
hist(carros$quilometragem, main = 'Histograma para Quilometragem de Carros Usados', ylab = 'Quilometragem (Km)', breaks = 5)

# Usa-se o scatterplot para analisar mais de uma variáveis, ou seja, multivariada

# Analisar a relação entre a variável preço e quilometragem
# Usando a variável preço como variável dependente (y)
plot(x = carros$quilometragem, y = carros$preco,
     main = 'Scatterplot - Preço vs Km',
     xlab = 'Quilometragem (Km)',
     ylab = 'Preço (R$)')

#### MEDIDAS DE DISPERSÃO ####
# Ao interpretar a variância, números muito altos indicam que os dados estão mais espalhados
# amplamente em torno da média. O desvio padrão indica, em média, a quantidade de cada valor
# diferente da média. Se a variância e o desvio padrão estiverem muito altos, é necessário 
# usar algumas técnicas para tratar estes valores
var(carros$preco)
sd(carros$preco)
var(carros$quilometragem)
sd(carros$quilometragem)

#### ANÁLISE EXPLORATÓRIA DE DADOS PARA VARIÁVEIS CATEGÓRICAS ####

# Criando tabelas de contingência - são usadas para registrar observações independentes 
# de duas ou mais variáveis aleatórias, normalmente qualitativas. 
# fonte: https://pt.wikipedia.org/wiki/Tabela_de_contingência

# Lista as categorias das variáveis nominais
?table
str(carros)

# Como exemplo, a variável cor e modelo são categóricas, podemos calcular as ocorrências de cada categoria
table(carros$cor)
table(carros$modelo)

# Calculando a proporção de cada categoria
model_table <- table(carros$modelo)
prop.table(model_table)

# Resolvendo o arredondamento e convertendo para formato percentual
model_table <- prop.table(model_table) * 100
model_table <- round(model_table, digits = 1)

# Criando uma nova variável indicando cores conservadoras
# (que as pessoas compram com mais frequência)
head(carros)
carros$conserv <- carros$cor %in% c('Preto','Cinza','Prata','Branco')

# Checando a variável - Quantos automóveis tem cores conservadoras e quantos não tem
table(carros$conserv)

# Checando o relacionamento entre duas variáveis categóricas criando uma Cross-Table
# Tabelas de Contingência fornecem uma maneira de exibir as frequências e frequências relativas
# de observações, que são classificadas de acordo com duas variáveis categóricas. Os elementos
# de uma categoria são exibidas através das colunas e os elementos de outra categoria são 
# são exibidas sobre as linhas
install.packages('gmodels')
library(gmodels)
?CrossTable

# Gerando a tabela cruzada entre modelo e cores conservadoras
gmodels::CrossTable(x = carros$modelo, y = carros$conserv)























