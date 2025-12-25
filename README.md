# The Future of Work: Mapping AI Automation Risk vs. Occupational Complexity

This project utilizes a data-driven approach to analyze the intersection of **AI Automation Risk** and **Occupational Complexity** across 700+ unique job roles.

## Interactive Dashboard
[**View the Interactive Dashboard on Tableau Public**](https://public.tableau.com/app/profile/sidharth.bharatwaj/viz/TheFutureofWorkMappingAIAutomationRiskvs_OccupationalComplexity/Dashboard1#1)

![AI Workforce Analysis Dashboard](AI_Workforce_Analysis_Dashboard_SS.png)

## About This Project
This project provides a data-driven analysis of how **Artificial Intelligence** is reshaping the global labor market. By evaluating over **700 unique job roles**, the analysis seeks to quantify the relationship between a job's technical automation risk and its cognitive or interpersonal complexity. 

The goal is to provide a predictive framework for identifying high-value human skills, AI augmentation potential, and sectors at risk of economic displacement.

## Key Frameworks
The analysis categorizes the workforce into four distinct segments:
* **Augmentable (Blue):** High Complexity / High Risk. AI acts as a "co-pilot," enhancing productivity for specialized roles like **Family Medicine Physicians**.
* **Stable (Red):** High Complexity / Low Risk. Roles requiring high emotional intelligence and non-routine problem solving, such as **Orderlies**.
* **Resilient (Orange):** Low Complexity / Low Risk. Physical or manual roles that remain difficult for current AI agents to replicate, such as **Carpet Installers**.
* **Vulnerable (Green):** Low Complexity / High Risk. Roles with high routine tasks susceptible to direct displacement, such as **Web and Digital Interface Designers**.

## Features
* **Interactive Wage Slider:** Dynamically filter the workforce by annual salary (starting at $30,830) to see risk distribution across income tiers.
* **Dual-Axis Mapping:** Quantifies the trade-off between technical automation capability and human cognitive demand.

## Data Engineering (Google BigQuery)
Before visualization, the raw labor data underwent extensive processing in BigQuery to ensure accuracy and readiness for analysis.

* **SQL-Driven Analysis:** Used BigQuery to perform complex joins between occupational task data and wage datasets.
* **Feature Engineering:** Developed the logic for the *Complexity Axis* and *Automation Risk* using SQL aggregate functions and CASE statements.
* **Data Cleaning:** Filtered out incomplete records and normalized wage data across 700+ job titles to provide a consistent baseline.
