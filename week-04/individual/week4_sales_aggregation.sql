-- Week: 4      Department: Marketing analytics     Role: Sales aggregation

/*
Task:
The task is to prepare a sales statistics report: monthly and category-based aggregate numbers, monthly trends.

Outputs:
3 SQL queries + summary table (main findings).
*/


-- 1. What are the sales by month for 2024?
SELECT
  DATE_TRUNC('month', sale_date) AS month,
  COUNT(sale_id) AS number_of_sales,
  SUM(total_price) AS total_sales,
  ROUND(AVG(total_price), 2) AS average_sale
FROM sales
WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY total_sales DESC;   


-- 1.1. What are the sales for 2024 by month and product category?
SELECT
  DATE_TRUNC('month', s.sale_date) AS month,
  p.category AS product_category,
  COUNT(s.sale_id) AS number_of_sales,
  ROUND(AVG(s.total_price), 2) AS average_sale,
  SUM(s.total_price) AS total_sales
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
WHERE DATE_TRUNC('month', sale_date) BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY DATE_TRUNC('month', sale_date), category
ORDER BY product_category, number_of_sales DESC;
/* Result: In 2024, total annual turnover has increased by approximately 100%.
Total turnover and number of orders in 2024 are highest in December (550 orders) and in the summer months (Aug, July, June).
Since women's clothing (dresses, blouses, etc.) sales are highest in December, June and August,
it can be concluded that the summer collection fits well with the target group and in the following years, lighter
and sustainable materials that customers prefer should be stocked for the summer.
The trend in the summer months suggests that targeted marketing campaigns are effective.
The peak in December is probably related to pre-holiday shopping and gift-giving.
The peak in December shows that Christmas campaigns are successful.
Also should consider increasing your social media budget during these periods to maximize purchases.
*/


-- 2. What are the sales by category?
SELECT
  p.category AS product_category,
  COUNT(DISTINCT p.product_id) AS number_of_products,
  ROUND(AVG(s.unit_price), 2) AS average_sale,
  SUM(s.quantity) AS quantity,
  SUM(s.total_price) AS total_sales
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
HAVING SUM(s.total_price) > 100000
ORDER BY total_sales DESC;

-- 2.1. I also find the percentage shares of the categories in the company's total turnover:
SELECT 
    p.category AS category,
    SUM(s.total_price) AS category_total_sales,
    ROUND(
        (SUM(s.total_price) / SUM(SUM(s.total_price)) OVER()) * 100, 
        2
    ) AS percentage_of_total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY percentage_of_total_sales DESC;
-- Result: The main source of revenue is brought in by the footwear, menswear and womenswear categories.
-- The footwear category accounts for 27% of the company's total turnover, menswear accounts for 26% and womenswear accounts for 24%.


-- 3. What is the month-to-month change in 2024?
WITH monthly_sales AS (
    SELECT
      DATE_TRUNC('month', sale_date) AS month,
      SUM(total_price) AS turnover
    FROM sales
    WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY DATE_TRUNC('month', sale_date)
    )
SELECT
  month,
  turnover,
  LAG(turnover) OVER (ORDER BY month) AS last_month,
  turnover - LAG(turnover) OVER (ORDER BY month) AS change
FROM monthly_sales
ORDER BY change DESC;

/*
Result:
Although the overall development of 2024 is stable, I observed a moderate monthly decline in turnover in the second half of the year (August, September and November), 
i.e. turnover in these months fell compared to the previous month, which is likely due to the end of the summer high season.
Therefore, emphasis should be placed on marketing campaigns at the end of summer and the beginning of autumn, such as "back-to-school discounts" etc.
I also recommend analyzing whether the decline in November could be mitigated in the future by starting an earlier Christmas campaign.
Looking at the monthly trend, it can be seen that the December Christmas campaign is very effective, as December turnover increased by 54% compared to November turnover.
Also, the large increase in turnover means the need to review stock levels before December to avoid unexpected product shortages.
The decline in turnover in these three months may also be due to inventory and stock problems.
For example, if popular products are not delivered on time, both the number of transactions and turnover will drop compared to the previous month.
Therefore, it is necessary to check the inventory and the real situation (how many products are actually in stock) so that the inventory can be replenished if necessary.
*/


-- 4. What is the month-on-month growth percentage for 2024?
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS month,
        SUM(total_price) AS turnover
    FROM sales
    WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    month,
    turnover,
    LAG(turnover) OVER (ORDER BY month) AS last_month,
    ROUND(((turnover - LAG(turnover) OVER (ORDER BY month)) / LAG(turnover) OVER (ORDER BY month)) * 100, 1) AS growth_percentage
FROM monthly_sales
ORDER BY growth_percentage DESC;

-- Result: It can be seen that the highest monthly growth rate is in December 2024 (approximately 54%) and the lowest growth rate is in September (approximately -25%).

/*
Sales summary —
* Annual turnover growth (in 2024): 100%, which confirms the rapid expansion of the company and the functioning of the business model.

* Average order value (in 2024):
highest in October 326€
lowest in March 266€

* Monthly turnover growth (in 2024):
highest in December 54%
lowest in September -25%

* Share of TOP categories in turnover:          average product price:
footwear         27%                                                  216€
men's clothing   26%                                                  190€
women's clothing 24%                                                  200€
*/