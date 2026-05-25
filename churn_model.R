# -----------------------------
# 1. Pacotes
# -----------------------------

library(tidyverse)
library(pROC)
library(rsample)
library(caret)

# -----------------------------
# 2. Carregar dados
# -----------------------------

df <- read_csv("dados/churn.csv")

# -----------------------------
# 3. Seleção de variáveis 
# -----------------------------

df <- df %>%
  select(customerID, SeniorCitizen, tenure, Contract, PaymentMethod, 
         MonthlyCharges, Churn)

# -----------------------------
# 4. Limpeza e transformação
# -----------------------------

df <- df%>%
  mutate(
    SeniorCitizen = factor(SeniorCitizen,
                           levels = c(0, 1),
                           labels = c("No", "Yes")),
    
    tenure_group = case_when(
      tenure < 12 ~ "< 1 ano",
      tenure < 24 ~ "1-2 anos",
      TRUE ~ "> 2 anos"),
    
    tenure_group = factor(tenure_group, 
                          levels = c("< 1 ano", "1-2 anos", "> 2 anos"),
                          ordered = TRUE),
    
    Churn = factor(ifelse(Churn == "No", 0, 1),
                   levels = c(0, 1),
                   labels = c("No", "Yes")),
    
    auto_payment = ifelse(PaymentMethod %in% c("Bank transfer (automatic)", "Credit card (automatic)"),
                          "Automatico",
                          "Manual")
    )

# Verificar NA

colSums(is.na(df))

# -----------------------------
# 5. Split treino / teste
# -----------------------------

set.seed(49182481)

split <- initial_split(df, prop = 0.7, strata = Churn)
train <- training(split)
test <- testing(split)

# Ajustar referência da variável alvo

train <- train %>%
  mutate(Churn = relevel(Churn, ref = "No"))
test  <- test %>% 
  mutate(Churn = relevel(Churn, ref = "No"))

# -----------------------------
# 6. Modelo
# -----------------------------

model <- glm(
  Churn ~ tenure + auto_payment + MonthlyCharges + Contract + SeniorCitizen,
  data = train,
  family = "binomial"
)

summary(model)

# -----------------------------
# 7. Previsão (teste)
# -----------------------------

test$churn_prob <- predict(model, newdata = test, type = "response")

# -----------------------------
# 8. Avaliação
# -----------------------------

roc_obj <- roc(test$Churn, test$churn_prob)
auc_val <- auc(roc_obj)
auc_val

best_thresh <- as.numeric(coords(roc_obj, "best", ret = "threshold"))
best_thresh

# Classificação com threshold ótimo

test$pred <- factor(
  ifelse(test$churn_prob > best_thresh, "Yes", "No"),
  levels = c("No", "Yes")
)


# -----------------------------
# 9. Métricas de classificação
# -----------------------------

confusionMatrix(test$pred, test$Churn, positive = "Yes")

# -----------------------------
# 10. Gain e Lift
# -----------------------------

# Ordenar por probabilidade decrescente

gain_df <- test %>%
  arrange(desc(churn_prob)) %>%
  mutate(rank = row_number(),
    pct_contacted = rank / n(),                          # % da base abordada
    cum_churners = cumsum(Churn == "Yes"),              # churners acumulados
    gain = cum_churners / sum(Churn == "Yes"),  # % dos churners capturados
    lift = gain / pct_contacted                 # lift vs aleatório
  )

# Pontos de referência úteis para o README

gain_table <- bind_rows(
  gain_df %>% slice_min(abs(pct_contacted - 0.1), n = 1),
  gain_df %>% slice_min(abs(pct_contacted - 0.2), n = 1),
  gain_df %>% slice_min(abs(pct_contacted - 0.3), n = 1),
  gain_df %>% slice_min(abs(pct_contacted - 0.4), n = 1),
  gain_df %>% slice_min(abs(pct_contacted - 0.5), n = 1)
) %>%
  select(pct_contacted, gain, lift) %>%
  mutate(pct_contacted = round(pct_contacted, 1)) 

# -----------------------------
# 11. Importando dados
# -----------------------------

write_delim(test, "Output/modelo.csv", delim = ";")
write_delim(df, "Output/dados.csv", delim = ";")
write_delim(gain_table, "Output/gain.csv", delim = ";")


