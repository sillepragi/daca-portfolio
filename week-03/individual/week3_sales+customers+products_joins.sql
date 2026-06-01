-- Week: 3      Department: Marketing analytics     Role: Analysis of sales channel effectiveness

/*
Task:
The task is to find which sales channels bring the most sales and which customers use which channels? An analysis of sales channels needs to be created.

Output:
SQL queries (.sql file) + screenshot of results + analysis of sales channels
*/

-- 1. I will see which sales channels exist in the sales table
SELECT DISTINCT channel 
FROM sales 
ORDER BY channel;
-- There are two different channels: online and store


-- 2. Which channel brings in the most sales?
SELECT
  s.channel AS channel,
  COUNT(DISTINCT s.customer_id) AS number_of_customers,
  COUNT(s.sale_id) AS number_of_sales,
  SUM(s.total_price) AS total_sales
FROM sales s
GROUP BY s.channel
ORDER BY total_sales DESC;
-- The store brings in the most sales


-- 3. Which channels do customers from which cities use?
SELECT
  s.channel AS channel,
  c.city AS city,
  COUNT(DISTINCT c.customer_id) AS number_of_customers,
  SUM(s.total_price) AS total_sales
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY s.channel, c.city
ORDER BY channel, total_sales DESC;
-- People from Tallinn, Tartu, Pärnu and Narva use the online channel the most. People from Tallinn, Tartu, Pärnu and Narva shop the most.


-- I count the number of customers (who have purchased) in the online store and in the store, so which channel brings in the most customers?
SELECT
  c.channel AS channel,
  COUNT(DISTINCT c.customer_id) AS number_of_customers
FROM customers s
INNER JOIN sales c ON c.customer_id = s.customer_id
GROUP BY c.channel
ORDER BY number_of_customers DESC;
-- The number of customers who purchased from store is 2278 and the number of customers who purchased online is 1706.


-- 4. Which products sell in which channel?
SELECT
  s.channel AS channel,
  p.category AS product_category,
  COUNT(DISTINCT c.customer_id) AS number_of_customers,
  COUNT(s.sale_id) AS number_of_sales,
  SUM(s.total_price) AS total_sales,
  ROUND(AVG(s.total_price), 2) AS average_purchase
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY s.channel, p.category
ORDER BY channel, total_sales DESC;
-- The most purchased items in the online channel are shoes, men's and women's clothing. The most purchased items in stores are men's clothing, shoes and women's clothing.


-- 5. I find the most effective channel (sales per customer)
SELECT
  s.channel AS channel,
  COUNT(DISTINCT s.customer_id) AS number_of_customers,
  SUM(s.total_price) AS total_sales,
  ROUND(SUM(s.total_price) / COUNT(DISTINCT s.customer_id), 2) AS sales_per_customer
FROM sales s
GROUP BY s.channel
ORDER BY sales_per_customer DESC;
-- The most effective channel is the store, where sales per customer are 835.13 euros (online sales per customer is 590.12 euros).


-- 6. I compare stores - I find the distribution of sales channels for each store
SELECT
  s.store_location AS store,
  s.channel AS channel,
  COUNT(s.sale_id) AS number_of_sales,
  SUM(s.total_price) AS total_sales,
  ROUND(SUM(s.total_price) / COUNT(s.sale_id), 2) AS average_purchase
FROM sales s
GROUP BY s.store_location, s.channel
ORDER BY store, total_sales DESC;


-- I remind myself what the company's total turnover was
SELECT SUM(total_price) AS total_turnover
FROM sales;
-- The company's total turnover is 2 909 188.98 euros

/* 

The three physical stores bring in about 60% (total sales of 1 902 430.30 euros) and the online store about 40% (total sales of 1 006 747.68 euros) of the total turnover.
The Pärnu store should contribute more to online sales, since the average purchase of the Pärnu store is the lowest. The marketing budget should be directed more to online sales.

SALES CHANNEL ANALYSIS RESULTS:

1) Physical stores bring in the most sales (total sales of the online store are 1,006,747.68 euros and total sales of the stores are 1 902 430.30 euros). The total sales of the three stores account for about 60% and the total sales of the online store are about 40% of the total turnover.
2) The number of customers who bought in the store is 2278 and the number of customers who bought in the online store is 1706, meaning that the store brings the most customers to the company.
3) The most effective channel is the store, where sales per customer are 835.13 euros (online sales per customer are 590.12 euros). This indicates that the online store is not yet fulfilling its full potential.
4) People from Tallinn, Tartu, Pärnu and Narva use the online channel the most. People from Tallinn, Tartu, Pärnu and Narva also visit the store the most. Although there is currently no store in Narva, a fairly large number of customers come from there.

*/