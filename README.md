# Análise de Churn - Telecom (R, Power BI)

## Introdução

Esse projeto consiste em uma análise preditiva de churn desenvolvida em R, com anáalise exploratória e resultados do modelo visualizados em um dashboard no Power BI.

O objetivo é identificar clientes com maior probabilidade de cancelamento em uma empresa de telecomunicações, utilzando modelagem estatística para apoiar decisões de retenção.

Download do código em R: Clique Aqui
Download da arquivo .pbix: Clique Aqui

## Exemplo do Dashboard

<img width="1155" height="633" alt="image" src="https://github.com/user-attachments/assets/cff5464b-6b0b-4fc4-8869-899c4ad58816" />

<img width="1270" height="710" alt="image" src="https://github.com/user-attachments/assets/0785b7c0-4d47-4418-bac1-878de2f05db7" />

## Objetivo

- Entender o perfil dos clientes que normalmente cancelam.
- Construir um modelo preditivo capaz de identificar clientes com alto risco de cancelamento.
- Traduzir os resultados com possíveis recomendações práticas de negócio.

## Ferramentas Utilizadas

- R (modelagem e análise)
  - tidyverse, rsample, pROC, caret
- Power BI (dashboard)

## Estrutura do Projeto

O projeto se divide em 3 partes principais:

### Código comentado em R

- Limpeza, seleção e criação de variáveis de interesse
- Criação do modelo preditivo, incluindo métricas de desempenho

### Visão geral do problema (Power BI - Página 1)

- Informações geral sobre a base, incluindo porcentagem de churn e número de pessoas que cancelaram
- Análise exploratória, cruzando diversas variáveis de interesse com a probabilidade de uma pessoa churnar

### Visão geral do modelo preditivo (Power BI - Página 2)

- Métricas específicas do modelo, como acurácia, recall (sensibilidade) e precisão, além do número de usuários em risco.
- Matrix de confusão e análise gráfica de gain para facilitar a visualização dos resultados do modelo.
- Breve explicação voltada à negócio para tomada de decisão.

## Principais descobertas

### Análise Exploratória

- Considerando que o valor de obter novos usuários pode ser extremamente maior que o valor de retenção, a taxa de 26,5% de Churn é extremamente preocupamente
- Contratos anuais e bienais apresentam churn proporcional consideravelmente menor que contratos mensais. Além disso, usuários com menos de um ano de contrato churnam bem mais. Incentivar contratos mais longos com serviços extras ou descontos pode ser uma boa estratégia, além de oferecer benefícios similares a usuários no ocmeço do contrato.
- Pessoas idosas tem chance maior de churn. Procurar entender o motivo por trás disso é importante para manter essas pessoas, seja dificuldade de usar os serviços ou serviços desnecessários acumulando no vallor.
- Pagamento manual tem chance bem maior de churn do que pagamento automático. O incentivo para esse tipo de pagamento é algo que deve ser considerado crucial.

### Análise do Modelo

- O modelo estatístico prioriza sensebilidade, ou seja, encontrar o maior número possível de clientes em risco de cancelamento. Em média, nosso modelo encontra 8 em cada 10 churners.
- Abordando 30% dos clientes com maior score, conseguimos capturar 65% de todos os churners, ou seja



