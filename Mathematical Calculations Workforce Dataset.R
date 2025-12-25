# Load necessary library
library(tidyverse)

# Load your exported BigQuery data
df <- read_csv("future_of_work_data.csv")

# Remove any rows with missing data in our four key metrics
df_clean <- df %>% 
  drop_na(creativity, digital_intensity, routine_admin, social_interaction)





# Select only the numeric columns for analysis
pca_input <- df_clean %>% 
  select(creativity, digital_intensity, routine_admin, social_interaction)

# Run the PCA
# 'scale = TRUE' standardizes the data so no single variable dominates
job_pca <- prcomp(pca_input, scale = TRUE)

# View the "Summary" to see how much of the economy's variance is explained
summary(job_pca)





# See which variables drive each component
print(job_pca$rotation)

# Create a "Scree Plot" to see the importance of each component
plot(job_pca, type = "l", main = "Scree Plot of Work Activities")





# Combine the original job data with the new PC scores
df_final <- cbind(df_clean, job_pca$x)

# Rename the columns for clarity in Tableau
df_final <- df_final %>%
  rename(Automation_Risk_Axis = PC1, 
         Complexity_Axis = PC2)






# 1. Move R to your Downloads folder
setwd("C:/Users/sidha/Downloads")

# 2. Confirm the move (It should now say .../Downloads)
getwd()

# 3. Save the file
write.csv(df_final, "final_labor_analysis.csv", row.names = FALSE)
