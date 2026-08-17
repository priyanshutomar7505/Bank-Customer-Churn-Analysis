USE bank_churn;

-- CREATE TABLE bank_customer_churn (
--     CustomerId INT,
--     Surname VARCHAR(100),
--     CreditScore INT,
--     Geography VARCHAR(50),
--     Age INT,
--     Tenure INT,
--     Balance DECIMAL(15,2),
--     NumOfProducts INT,
--     HasCrCard INT,
--     IsActiveMember INT,
--     EstimatedSalary DECIMAL(15,2),
--     Exited INT
-- );

## Count Total Rows 
-- SELECT COUNT(*) AS Total_Rows
-- FROM bank_customer_churn;


## Find Unique customers
-- SELECT COUNT(DISTINCT CustomerId) AS Unique_Customers
-- FROM bank_customer_churn;

##Check Duplicates
-- SELECT
--     CustomerId,
--     COUNT(*) AS Count
-- FROM bank_customer_churn
-- GROUP BY CustomerId
-- HAVING COUNT(*) > 1;


## Check Missing value
-- SELECT
--     SUM(CustomerId IS NULL) AS Missing_CustomerId,
--     SUM(Surname IS NULL) AS Missing_Surname,
--     SUM(CreditScore IS NULL) AS Missing_CreditScore,
--     SUM(Geography IS NULL) AS Missing_Geography,
--     SUM(Age IS NULL) AS Missing_Age,
--     SUM(Tenure IS NULL) AS Missing_Tenure,
--     SUM(Balance IS NULL) AS Missing_Balance,
--     SUM(NumOfProducts IS NULL) AS Missing_Products,
--     SUM(HasCrCard IS NULL) AS Missing_CreditCard,
--     SUM(IsActiveMember IS NULL) AS Missing_ActiveMember,
--     SUM(EstimatedSalary IS NULL) AS Missing_Salary,
--     SUM(Exited IS NULL) AS Missing_Exited
-- FROM bank_customer_churn;

 ##Understands the Target --Exited
--  SELECT
--     Exited,
--     COUNT(*) AS Customers
-- FROM bank_customer_churn
-- GROUP BY Exited;

##Calculate overall churn Rates
-- SELECT
--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,
--     COUNT(*) - SUM(Exited) AS Retained_Customers,
--     ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- FROM bank_customer_churn;

##Churn by Geography
-- SELECT
--    Geography,
--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,
--     COUNT(*) - SUM(Exited) AS Retained_Customers,
--     ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- FROM bank_customer_churn
-- GROUP BY Geography
-- ORDER BY Churn_Rate DESC;


-- ##Active vs Inactive customers
-- SELECT
--  IsActiveMember,
--   COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,
--     ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- FROM bank_customer_churn
-- GROUP BY IsActiveMember
-- ORDER BY Churn_Rate DESC;

-- ##Credit Analysis
-- SELECT
--     HasCrCard,
--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,
--     ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- FROM bank_customer_churn
-- GROUP BY HasCrCard
-- ORDER BY Churn_Rate DESC;

-- ##Number of Product Analysis
-- SELECT
--     NumOfProducts,
--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,
--     ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- FROM bank_customer_churn
-- GROUP BY NumOfProducts
-- ORDER BY NumOfProducts;

## 10. Tenure Analysis
-- SELECT
--     Tenure,
--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,
-- ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- FROM bank_customer_churn
-- GROUP BY Tenure
-- ORDER BY Tenure;


-- ## 11. Age Analysis
-- SELECT
--     Age,
--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,
--     ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
-- FROM bank_customer_churn
-- GROUP BY Age
-- ORDER BY Age;
-- SELECT
--     CASE
--         WHEN Age < 30 THEN 'Under 30'
--         WHEN Age BETWEEN 30 AND 39 THEN '30-39'
--         WHEN Age BETWEEN 40 AND 49 THEN '40-49'
--         WHEN Age BETWEEN 50 AND 59 THEN '50-59'
--         ELSE '60+'
--     END AS Age_Group,

--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,

--     ROUND(
--         SUM(Exited) * 100.0 / COUNT(*),
--         2
--     ) AS Churn_Rate

-- FROM bank_customer_churn

-- GROUP BY
--     CASE
--         WHEN Age < 30 THEN 'Under 30'
--         WHEN Age BETWEEN 30 AND 39 THEN '30-39'
--         WHEN Age BETWEEN 40 AND 49 THEN '40-49'
--         WHEN Age BETWEEN 50 AND 59 THEN '50-59'
--         ELSE '60+'
--     END

-- ORDER BY Churn_Rate DESC;

-- ## 12. Credit score Analysis
-- SELECT
--     CASE
--         WHEN CreditScore < 500 THEN 'Below 500'
--         WHEN CreditScore BETWEEN 500 AND 599 THEN '500-599'
--         WHEN CreditScore BETWEEN 600 AND 699 THEN '600-699'
--         WHEN CreditScore BETWEEN 700 AND 799 THEN '700-799'
--         ELSE '800+'
--     END AS Credit_Score_Group,

--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,

--     ROUND(
--         SUM(Exited) * 100.0 / COUNT(*),
--         2
--     ) AS Churn_Rate

-- FROM bank_customer_churn

-- GROUP BY
--     CASE
--         WHEN CreditScore < 500 THEN 'Below 500'
--         WHEN CreditScore BETWEEN 500 AND 599 THEN '500-599'
--         WHEN CreditScore BETWEEN 600 AND 699 THEN '600-699'
--         WHEN CreditScore BETWEEN 700 AND 799 THEN '700-799'
--         ELSE '800+'
--     END

-- ORDER BY Churn_Rate DESC;

-- ## 13. Salary Analysis
-- SELECT
--     CASE
--         WHEN EstimatedSalary < 50000 THEN 'Below 50K'
--         WHEN EstimatedSalary < 100000 THEN '50K-100K'
--         WHEN EstimatedSalary < 150000 THEN '100K-150K'
--         ELSE '150K+'
--     END AS Salary_Group,

--     COUNT(*) AS Total_Customers,
--     SUM(Exited) AS Churned_Customers,

--     ROUND(
--         SUM(Exited) * 100.0 / COUNT(*),
--         2
--     ) AS Churn_Rate

-- FROM bank_customer_churn

-- GROUP BY
--     CASE
--         WHEN EstimatedSalary < 50000 THEN 'Below 50K'
--         WHEN EstimatedSalary < 100000 THEN '50K-100K'
--         WHEN EstimatedSalary < 150000 THEN '100K-150K'
--         ELSE '150K+'
--     END

-- ORDER BY Churn_Rate DESC;

## 14. Balance Analysis
-- SELECT
--     Exited,
--     COUNT(*) AS Customers,
--     ROUND(AVG(Balance), 2) AS Average_Balance
-- FROM bank_customer_churn
-- GROUP BY Exited;

## 15. Customers Profile
-- SELECT
--     Exited,

--     COUNT(*) AS Customers,

--     ROUND(AVG(Age), 2) AS Avg_Age,

--     ROUND(AVG(CreditScore), 2) AS Avg_CreditScore,

--     ROUND(AVG(Balance), 2) AS Avg_Balance,

--     ROUND(AVG(Tenure), 2) AS Avg_Tenure,

--     ROUND(AVG(NumOfProducts), 2) AS Avg_Products,

--     ROUND(AVG(EstimatedSalary), 2) AS Avg_Salary

-- FROM bank_customer_churn

-- GROUP BY Exited;

## 16. Find high risk- customers profile
-- SELECT
--     CustomerId,
--     Geography,
--     Age,
--     CreditScore,
--     Balance,
--     NumOfProducts,
--     EstimatedSalary
-- FROM bank_customer_churn
-- WHERE
--     IsActiveMember = 0
--     AND Exited = 1
-- ORDER BY Balance DESC;

## 17. Find high balanced customers
-- SELECT
--     CustomerId,
--     Geography,
--     Age,
--     CreditScore,
--     Balance,
--     NumOfProducts,
--     IsActiveMember
-- FROM bank_customer_churn
-- WHERE Exited = 1
-- ORDER BY Balance DESC
-- LIMIT 20;

-- ## 18. Combine Multiple condations
-- SELECT
--     CustomerId,
--     Geography,
--     Age,
--     CreditScore,
--     Balance,
--     NumOfProducts,
--     EstimatedSalary
-- FROM bank_customer_churn
-- WHERE
--     Exited = 1
--     AND IsActiveMember = 0
--     AND Balance > 100000
-- ORDER BY Balance DESC;

## 19.Geography + Active Membership
-- SELECT
--     Geography,
--     IsActiveMember,

--     COUNT(*) AS Total_Customers,

--     SUM(Exited) AS Churned_Customers,

--     ROUND(
--         SUM(Exited) * 100.0 / COUNT(*),
--         2
--     ) AS Churn_Rate

-- FROM bank_customer_churn

-- GROUP BY
--     Geography,
--     IsActiveMember

-- ORDER BY
--     Geography,
--     Churn_Rate DESC;


## 20.Geography + Products
-- SELECT
--     Geography,
--     NumOfProducts,

--     COUNT(*) AS Customers,

--     SUM(Exited) AS Churned,

--     ROUND(
--         SUM(Exited) * 100.0 / COUNT(*),
--         2
--     ) AS Churn_Rate

-- FROM bank_customer_churn

-- GROUP BY
--     Geography,
--     NumOfProducts

-- ORDER BY Churn_Rate DESC;






