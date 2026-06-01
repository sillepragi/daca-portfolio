-- Week: 6      Department: Marketing analytics     Role: The story of the Pärnu store

/*
Task:
Create an interactive dashboard for the Pärnu store with a data story. 
Pärnu is the smallest store and has strong seasonality (summer resort). 
The task is to show the seasonal pattern and its business meaning.

Output:
Interactive dashboard.
Executive summary. 
At least 2 annotations on the charts and 1 reference line (target or average). 
Add a data story.
*/

-- Step 1: I find the sales trend in Pärnu by month + I calculate the average purchase for all months and find the percentage difference with the annual average
WITH MonthlySales AS (
    -- I calculate the total turnover each month (I use DATE_TRUNC to keep years and months separate)    
    SELECT 
        DATE_TRUNC('month', sale_date) AS month,
        SUM(total_price) AS monthly_income
    FROM sales
    WHERE store_location = 'Pärnu' -- Example based on the Pärnu store
    GROUP BY 1
),
Statistics AS (
    -- I calculate the average income for all months
    SELECT 
        AVG(monthly_income) AS average_month_of_year
    FROM MonthlySales
)
    -- I find the difference percentage with the formula: ((monthly_turnover - annual_average) / annual_average) * 100
SELECT 
    month,
    ROUND(monthly_income, 2) AS monthly_turnover,
    ROUND(average_month_of_year, 2) AS annual_average,
    ROUND(((monthly_income - average_month_of_year) / average_month_of_year) * 100, 2) AS difference_percentage
FROM MonthlySales, Statistics
ORDER BY difference_percentage DESC;


-- Step 2: I find what percentage of the annual turnover is accounted for by the summer and winter periods
WITH SalesAggregate AS (
    SELECT 
        SUM(total_price) AS total_annual_income,
        SUM(CASE WHEN EXTRACT(MONTH FROM sale_date) IN (6, 7, 8) THEN total_price ELSE 0 END) AS summer_revenue,
        SUM(CASE WHEN EXTRACT(MONTH FROM sale_date) IN (12, 1, 2) THEN total_price ELSE 0 END) AS winter_revenue
    FROM sales
    WHERE store_location = 'Pärnu' -- I only filter the data for the Pärnu store
)
SELECT 
    summer_revenue,
    winter_revenue,
    total_annual_income,
    ROUND((summer_revenue / total_annual_income) * 100, 2) AS summer_percentage,
    ROUND((winter_revenue / total_annual_income) * 100, 2) AS winter_percentage
FROM SalesAggregate;
-- Answer: 29% is the summer and 26% is the winter period share


-- Step 3: I find both the seasonality of monthly sales revenue and the deviation from the period average
WITH MonthlySales AS (
    -- 1. I calculate the total turnover every month
    SELECT 
        DATE_TRUNC('month', sale_date) AS month,
        SUM(total_price) AS monthly_income
    FROM sales
    WHERE store_location = 'Pärnu' -- I only filter the data for the Pärnu store
    GROUP BY 1
),
Statistics AS (
    -- 2. I calculate the arithmetic mean of all months
    SELECT 
        AVG(monthly_income) AS average_month_of_year
    FROM MonthlySales
)
    -- 3. I find the difference percentage: ((monthly_income - average_month_of_year) / average_month_of_year) * 100
SELECT 
    month,
    ROUND(monthly_income, 2) AS monthly_turnover,
    ROUND(average_month_of_year, 2) AS annual_average,
    ROUND(((monthly_income - average_month_of_year) / average_month_of_year) * 100, 2) AS vahe_protsent
FROM MonthlySales, Statistics
ORDER BY month;


-- Step 4: I find the percentage contribution of the TOP 5 products to the total sales of the Pärnu store
WITH TotalTurnover AS (
    -- 1. I first calculate the total turnover of the store
    SELECT SUM(total_price) AS total_amount 
    FROM sales 
    WHERE store_location = 'Pärnu'
),
ProductTurnover AS (
    -- 2. I find the turnover of each product and connect it with the names
    SELECT 
        p.product_name,
        SUM(s.total_price) AS product_total_price
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    WHERE s.store_location = 'Pärnu'
    GROUP BY p.product_name
)
    -- 3. I calculate the percentages and take the TOP 5SELECT 
    product_name,
    product_total_price,
    ROUND((product_total_price / (SELECT total_amount FROM TotalTurnover)) * 100, 2) AS percentage_of_turnover
FROM ProductTurnover
ORDER BY product_total_price DESC
LIMIT 5;


-- Step 5: I check the growth rate 2024 vs 2023
WITH AnnualSales AS (
    -- 1. Group sales revenue by year
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        SUM(total_price) AS annual_turnover
    FROM sales
    WHERE store_location = 'Pärnu' -- I only filter the data for the Pärnu store
    GROUP BY 1
),
Comparison AS (
    -- 2. I use the LAG() function to bring last year's value next to the current one
    SELECT 
        year,
        annual_turnover,
        LAG(annual_turnover) OVER (ORDER BY year) AS last_year
    FROM AnnualSales
)
    -- 3. I calculate the growth rate with the formula: ((New - Old) / Old) * 100
SELECT 
    year,
    ROUND(annual_turnover, 2) AS income_2024,
    ROUND(last_year, 2) AS income_2023,
    ROUND(((annual_turnover - last_year) / last_year) * 100, 2) AS growth_rate_yoy
FROM Comparison
WHERE year = 2024;
-- Answer: The growth rate between 2024 and 2023 is 4.30%