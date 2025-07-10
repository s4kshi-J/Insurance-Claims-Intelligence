library(data.table)
claims <- fread(file.choose())

library(data.table)
library(ggplot2)

#overview
str(claims)
summary(claims)
head(claims)
names(claims)

install.packages("benford.analysis")
library(benford.analysis)
benford_result <- benford(claims$total_claim_amount)
plot(benford_result)

par(mfrow = c(1, 3))  

boxplot(claims$injury_claim, main = "Injury Claim", col = "salmon")
boxplot(claims$property_claim, main = "Property Claim", col = "skyblue")
boxplot(claims$vehicle_claim, main = "Vehicle Claim", col = "lightgreen")

detect_outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR_val <- Q3 - Q1
  return(ifelse(x < (Q1 - 1.5 * IQR_val) | x > (Q3 + 1.5 * IQR_val), 1, 0))
}

claims$injury_outlier <- detect_outliers(claims$injury_claim)
claims$vehicle_outlier <- detect_outliers(claims$vehicle_claim)
claims$property_outlier <- detect_outliers(claims$property_claim)

cluster_data <- claims[, .(total_claim_amount, injury_claim, property_claim, vehicle_claim)]
cluster_data <- na.omit(cluster_data)
scaled_data <- scale(cluster_data)
set.seed(123)
kmeans_result <- kmeans(scaled_data, centers = 3, nstart = 25)
claims$risk_cluster <- kmeans_result$cluster

claims$risk_level <- factor(claims$risk_cluster,
                            levels = c(1, 2, 3),
                            labels = c("Moderate Risk", "Low Risk", "High Risk"))

fwrite(claims, "C:/Users/b4ujs/Documents/claims_enriched.csv")
