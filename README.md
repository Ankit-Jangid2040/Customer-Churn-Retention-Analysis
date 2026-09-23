# Customer Churn & Retention Analysis

##  Project Overview

Customer Churn & Retention Analysis is a data analytics project focused on understanding customer behavior, churn patterns, and retention trends.

The project uses SQL, Python, Exploratory Data Analysis (EDA), basic statistics, and Power BI to transform customer data into meaningful business insights.

---

##  Objectives

- Analyze customer churn and retention patterns.
- Understand customer behavior and service usage.
- Analyze churn based on contract and payment methods.
- Study the relationship between customer tenure and charges.
- Identify customer segments with different churn patterns.
- Create interactive dashboards using Power BI.
- Generate useful business insights from customer data.

---

##  Technologies Used

- Microsoft Excel
- MySQL
- SQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- Power BI
- Git & GitHub

---

##  Project Workflow

Excel  
↓  
Data Cleaning & Understanding  
↓  
MySQL & SQL Analysis  
↓  
Python Data Analysis  
↓  
Exploratory Data Analysis (EDA)  
↓  
Statistical Analysis  
↓  
Power BI Dashboard  
↓  
Business Insights

---

##  Dataset

The dataset contains customer-level information related to customer demographics, services, tenure, contract type, payment method, monthly charges, total charges, and churn status.

### Major Attributes

- Customer ID
- Gender
- Senior Citizen
- Partner
- Dependents
- Tenure
- Contract
- Payment Method
- Monthly Charges
- Total Charges
- Internet Service
- Online Security
- Technical Support
- Streaming Service
- Churn

---

##  Python Analysis

Python was used for data cleaning, exploration, and visualization.

### Libraries Used

- Pandas
- NumPy
- Matplotlib
- Seaborn

### Analysis Performed

- Data cleaning
- Missing value analysis
- Customer distribution
- Churn analysis
- Tenure analysis
- Monthly charges analysis
- Service-wise analysis
- Contract-wise analysis
- Correlation analysis
- Basic statistical analysis

---

##  SQL Analysis

MySQL and SQL were used for structured customer data analysis.

### SQL Analysis Includes

- Total customers
- Churned customers
- Retained customers
- Churn rate
- Customer distribution by contract
- Churn by payment method
- Churn by internet service
- Tenure analysis
- Monthly and total charges analysis

---

##  Power BI Dashboard

The project contains two interactive Power BI dashboard pages.

### Dashboard 1 — Customer Churn & Retention Overview

Includes:

- Total Customers
- Churned Customers
- Retained Customers
- Churn Rate
- Retention Rate
- Customer Churn Distribution
- Churn by Contract
- Customer Distribution by Contract
- Churn by Payment Method
- Customer Tenure Analysis

### Dashboard 2 — Customer Behavior & Retention Analysis

Includes:

- Churn by Tenure
- Churn by Monthly Charges
- Churn by Internet Service
- Churn by Technical Support
- Churn by Online Security
- Churn by Payment Method
- Customer Segment Analysis

---

## 🔍 Key Insights

The analysis helps understand:

- Customer churn patterns across different contract types.
- Differences in churn behavior based on customer tenure.
- Relationship between monthly charges and churn.
- Churn patterns across different payment methods.
- Impact of service usage on customer retention.
- Customer segments that may require greater retention attention.

---

##  Project Structure

```text
Customer-Churn-Retention-Analysis/
│
├── 01_Dataset/
│   ├── Customer_Churn_Cleaned.csv
│   └── WA_Fn-UseC_-Telco-Customer-Churn.csv
│
├── 02_python/
│   └── Customer_Churn_Retention_Analysis.ipynb
│
├── 03_SQL/
│   └── Customer_Churn_SQL_Analysis.sql
│
├── 04_Power BI/
│   ├── Customer_Churn_Retention_Dashboard.pbix
│   ├── Dashboard_1.png
│   └── Dashboard_2.png
│
├── 05_Report/
│   └── CCR-Report-Final.pdf
│
└── README.md
