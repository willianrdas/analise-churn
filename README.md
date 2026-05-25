# Análise de Churn - Telecom (R, Power BI)

## Introdução

Esse projeto consiste em uma análise preditiva de churn desenvolvida em R, com anáalise exploratória e resultados do modelo visualizados em um dashboard no Power BI.

O objetivo é identificar clientes com maior probabilidade de cancelamento em uma empresa de telecomunicações, utilzando modelagem estatística para apoiar decisões de retenção.

Download do código em R: [Clique Aqui](https://github.com/willianrdas/analise-churn/raw/refs/heads/main/churn_model.R)

Download da arquivo .pbix: [Clique Aqui](https://github.com/willianrdas/analise-churn/raw/refs/heads/main/Relatorio%20Final.pbix)

## Exemplo do Dashboard

<img width="1349" height="770" alt="image" src="https://github.com/user-attachments/assets/27b25fe6-aab0-44fc-8678-5aefe43165ca" />

<img width="1344" height="777" alt="image" src="https://github.com/user-attachments/assets/6c6dd9b8-5698-413b-8828-20ed9c594afa" />

## Objetivo

- Entender o perfil dos clientes que mais cancelam
- Construir um modelo preditivo capaz de identificar clientes em risco
- Traduzir os resultados em recomendações práticas de negócio

## Ferramentas Utilizadas

- R (modelagem e análise)
  - tidyverse, rsample, pROC, caret
- Power BI (dashboard)

## Estrutura do Projeto

O projeto se divide em 3 partes principais:

### Código comentado em R

- Limpeza, seleção e criação de variáveis de interesse
- Criação do modelo preditivo com métricas de desempenho e curvas de Gain

### Visão geral da base (Power BI - Página 1)

- Indicadores gerais: taxa de churn, ticket médio e total de clientes
- Análise exploratória cruzando variáveis de interesse com o comportamento de cancelamento

### Visão geral do modelo preditivo (Power BI - Página 2)

- Métricas de desempenho: acurácia, sensibilidade e precisão
- Matrix de confusão e curva de gain para visualização dos resultados
- Interpretação voltada a negócio para apoio à tomada de decisão
- 
## Principais descobertas

### Análise Exploratória

- A taxa de churn de 26,5% é preocupante considerando que o custo de aquisição de novos clientes costuma ser muito superior ao custo de retenção. Cada cliente perdido representa um investimento desperdiçado.
- Contratos anuais e bienais apresentam churn proporcionalmente muito menor do que contratos mensais. Além disso, clientes com menos de um ano de vínculo cancelam com mais frequência. Incentivar contratos mais longos com descontos ou benefícios — especialmente nos primeiros meses — pode ser uma estratégia eficaz de retenção.
- Clientes idosos apresentam maior propensão ao cancelamento. Entender o motivo é fundamental: pode ser dificuldade no uso dos serviços, suporte insuficiente ou acúmulo de serviços desnecessários no plano.
- Pagamento manual está associado a uma taxa de churn bem superior ao pagamento automático, possivelmente indicando menor engajamento com o serviço. Incentivar a adesão ao débito automático deve ser considerado uma ação prioritária.


### Análise do Modelo

- O modelo prioriza sensibilidade — encontrar o maior número possível de clientes em risco de cancelamento. Em média, identifica corretamente 8 em cada 10 churners.
- Abordando apenas 30% dos clientes com maior score de risco, é possível capturar ~65% de todos os churners — aproximadamente 2,1 vezes mais eficiente do que uma seleção aleatória com o mesmo orçamento.
- O valor de precisão mais baixo é esperado e consciente: conforme a sensibilidade aumenta, a precisão diminui. Esse trade-off faz sentido porque o custo de perder um cliente que iria cancelar é, em geral, muito superior ao custo de uma ação de retenção desnecessária.

## Fonte de Dados

Dataset utilizado: Telco Customer Churn
Fonte: Kaggle  
Link: https://www.kaggle.com/datasets/blastchar/telco-customer-churn


