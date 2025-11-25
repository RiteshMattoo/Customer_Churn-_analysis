#SQL ANALYSIS QUERIES
# Total Customers & Churn Count

SELECT 
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND( (SUM(Churn) / COUNT(*)) * 100 ,2 ) AS churn_rate
FROM customers;


#Churn Rate by Gender

SELECT 
    gender,
    COUNT(*) AS total,
    SUM(Churn) AS churned,
    ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate
FROM customers
GROUP BY gender;

#Churn Rate by Contract Type

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned,
    ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;

#Churn vs Monthly Charges

SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM customers
GROUP BY Churn;

# High-Risk Customers

SELECT *
FROM customers
WHERE tenure < 6
   OR MonthlyCharges > 80
   OR Contract = 'Month-to-month';

#Top Reasons for Churn (Based on Patterns)

SELECT 
    InternetService,
    OnlineSecurity,
    TechSupport,
    COUNT(*) AS count_churned
FROM customers
WHERE Churn = 1
GROUP BY InternetService, OnlineSecurity, TechSupport
ORDER BY count_churned DESC;
