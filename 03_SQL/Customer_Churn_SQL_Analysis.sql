-- =====================================================
-- Customer Churn & Retention Analysis
-- SQL Analysis
-- Dataset: Telco Customer Churn
-- Records: 7032
-- =====================================================

-- 1. Create Database
CREATE DATABASE Customer_Churn_Analysis;

-- Select Database
USE Customer_Churn_Analysis;


-- ============================================
-- 2. Create Customer Churn Table
-- ============================================

CREATE TABLE customers (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(10)
);


-- Create Customer Churn Table

CREATE TABLE customer_churn (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(10)
);

-- verify data 
USE Customer_Churn_Analysis;

SELECT COUNT(*) AS Total_Customers
FROM customers;

--Top 10 customers
SELECT *
FROM customers
LIMIT 10;


USE Customer_Churn_Analysis;

-- 1. Total customers
SELECT COUNT(*) AS Total_Customers
FROM customers;

-- 2. Table structure
DESCRIBE customers;

-- 3. First 10 records
SELECT *
FROM customers
LIMIT 10;

-- Q1. Total Number of Customers

SELECT COUNT(*) AS Total_Customers
FROM customers;

-- Q2. Total Churned Customers

SELECT COUNT(*) AS Churned_Customers
FROM customers
WHERE Churn = 'Yes';

-- Q3. Total Non-Churned Customers

SELECT COUNT(*) AS Non_Churned_Customers
FROM customers
WHERE Churn = 'No';

-- Q4. Overall Churn Rate

SELECT 
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS Churn_Rate_Percentage
FROM customers;



-- Q5. Total Churned Customers

SELECT COUNT(*) AS Churned_Customers
FROM customers
WHERE Churn = 'Yes';

-- Q6. Churned Customers by Gender

SELECT 
    gender,
    COUNT(*) AS Churned_Customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY gender;

-- Q7. Churn Rate by Gender

SELECT 
    gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY gender;


-- Q8. Churn Rate by Contract Type

SELECT 
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY Contract
ORDER BY Churn_Rate_Percent DESC;



-- Q9. Churn Rate by Internet Service

SELECT 
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY InternetService
ORDER BY Churn_Rate_Percent DESC;


-- Q10. Churn Rate by Payment Method

SELECT 
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY PaymentMethod
ORDER BY Churn_Rate_Percent DESC;



-- Q11. Churn Rate by Senior Citizen Status

SELECT 
    CASE 
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior Citizen'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY SeniorCitizen
ORDER BY Churn_Rate_Percent DESC;




-- Q12. Churn Rate by Tenure Group

SELECT 
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12 Months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
        WHEN tenure BETWEEN 49 AND 72 THEN '49-72 Months'
    END AS Tenure_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers

GROUP BY Tenure_Group

ORDER BY Churn_Rate_Percent DESC;



-- Q13. Average Monthly Charges by Churn Status

SELECT 
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges
FROM customers
GROUP BY Churn;



-- Q14. Average Total Charges by Churn Status

SELECT 
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(TotalCharges), 2) AS Avg_Total_Charges
FROM customers
GROUP BY Churn;



-- Q15. Average Tenure by Churn Status

SELECT 
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(tenure), 2) AS Avg_Tenure_Months
FROM customers
GROUP BY Churn;



-- Q16. Churn Rate for High Monthly Charges Customers

SELECT 
    CASE
        WHEN MonthlyCharges >= 70 THEN 'High Charges (>=70)'
        ELSE 'Normal Charges (<70)'
    END AS Charge_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers
GROUP BY Charge_Group
ORDER BY Churn_Rate_Percent DESC;


-- Q17. Churn Rate for Long-Tenure Customers

SELECT 
    CASE
        WHEN tenure >= 48 THEN 'Long Tenure (48+ Months)'
        ELSE 'Short/Medium Tenure (<48 Months)'
    END AS Tenure_Type,

    COUNT(*) AS Total_Customers,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers
GROUP BY Tenure_Type
ORDER BY Churn_Rate_Percent DESC;



-- Q18. Partner Status vs Churn

SELECT 
    Partner,
    COUNT(*) AS Total_Customers,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers
GROUP BY Partner
ORDER BY Churn_Rate_Percent DESC;



-- Q19. Dependents Status vs Churn

SELECT 
    Dependents,
    COUNT(*) AS Total_Customers,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers
GROUP BY Dependents
ORDER BY Churn_Rate_Percent DESC;

-- Q20. Tech Support and Online Security vs Churn

SELECT 
    TechSupport,
    OnlineSecurity,

    COUNT(*) AS Total_Customers,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers
GROUP BY TechSupport, OnlineSecurity
ORDER BY Churn_Rate_Percent DESC;