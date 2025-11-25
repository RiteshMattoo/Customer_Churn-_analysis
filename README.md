# 📊 Customer Churn Analysis Project (SQL + Power BI)

   This project is an end-to-end Customer Churn Analysis built using:

   MySQL → Data Cleaning & Feature Engineering

  Power BI → Dashboard & Insights

  CSV Dataset → Telco Customer Churn data

  The goal is to identify what factors influence customer churn and present insights using interactive dashboards.

## 📌 1. Dataset Description

 The dataset contains 7,043 customer records with fields like:

 Customer demographics (gender, senior citizen, partner, dependents)

 Subscription details (contract, internet service, payment method)

 Charges (monthly charges, total charges)

 Target variable → Churn (1 = Yes, 0 = No)

## 📌 2. SQL Data Cleaning (MySQL)

 ✔️ Remove Extra Spaces

UPDATE customers

SET customerID = TRIM(customerID),

gender = TRIM(gender),

 Partner = TRIM(Partner),
 
 Dependents = TRIM(Dependents),
  
 PhoneService = TRIM(PhoneService),
 
 MultipleLines = TRIM(MultipleLines),
 
 InternetService = TRIM(InternetService),
    
 OnlineSecurity = TRIM(OnlineSecurity),
 
 OnlineBackup = TRIM(OnlineBackup),
 
 DeviceProtection = TRIM(DeviceProtection),
 
TechSupport = TRIM(TechSupport),

StreamingTV = TRIM(StreamingTV),

StreamingMovies = TRIM(StreamingMovies),

Contract = TRIM(Contract),

PaperlessBilling = TRIM(PaperlessBilling),
 
PaymentMethod = TRIM(PaymentMethod),

✔️ Fix TotalCharges (empty → NULL, convert to decimal)

   UPDATE customers SET TotalCharges = NULL WHERE TRIM(TotalCharges) = '';
   
   UPDATE customers SET TotalCharges = NULL WHERE TotalCharges REGEXP '[^0-9\.]';

   ALTER TABLE customers
   
   MODIFY COLUMN TotalCharges DECIMAL(10,2);

   ## 📌 3. SQL Analysis Queries

 🔹 Total Customers, Churn Count & Churn Rate
 
 SELECT 
  
  COUNT(*) AS total_customers,
 
  SUM(Churn) AS churned_customers,
 
  ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate
 
 FROM customers;

🔹Churn by Gender

SELECT 
   
  gender,
  
  COUNT(*) AS total,
  
  SUM(Churn) AS churned,
  
  ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate
  
FROM customers

GROUP BY gender;

🔹 Churn by Contract Type

SELECT 
   
 Contract
    
 COUNT(*) AS total_customers,
    
 SUM(Churn) AS churned,
    
 ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate
    
FROM customers

GROUP BY Contract

ORDER BY churn_rate DESC;

🔹 Avg Monthly Charges (Churn vs Non-Churn)

  SELECT 
  
   Churn,
    
   ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
    
FROM customers

GROUP BY Churn;


## 📌 4. Power BI Dashboard

This project includes an interactive Customer Churn Dashboard with:

✔️ KPI Cards

Total Customers

Churned Customers

Churn Rate

Average Monthly Charges

✔️ Visuals

📊 Churn Rate by Gender

📊 Tenure Distribution (Binned)

📊 Churn by Contract Type

📊 Churn vs Monthly Charges

📊 Senior Citizen vs Churn


## 📸 Sample Screenshots

### Dashboard Overview

![Dashboard](PowerBI/Screenshot 1.jpeg)

### Male Vs Female churn rate

![Male Vs Female Churn Rate](PowerBI/Screenshot 2.jpeg)

### Churn by Contract Type

![Churn By Contract Type](PowerBI/Screenshot 3.jpeg)

### Tenure Distribution

![Tenure Distribution](PowerBI/Screenshot 4.jpeg)


## 📚 Key Insights from the Dashboard

1.Customers with Month-to-Month contracts churn the most

2.Higher monthly charges → higher churn

3.Low tenure customers are at high risk

4.Customers without Tech Support or Online Security churn more

5.Female and male churn rates are nearly equal

## 🚀 Conclusion

This project demonstrates:

✔ Real-world data cleaning techniques

✔ SQL analytics for churn prediction

✔ A complete Power BI business dashboard

✔ Actionable insights for retention strategy

