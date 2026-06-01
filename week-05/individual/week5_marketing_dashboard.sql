-- Week: 5      Department: Marketing analytics     Role: Marketing dashboard

-- Task: A marketing manager wants to see which sales channels are generating the most customers and sales. Create a marketing dashboard that shows the effectiveness of the channels and the customer acquisition pattern.
-- Output: 2 charts + business interpretation. I create two charts: 1) sales by sales channel (bar chart) and 2) customer acquisition over time (line chart). I find the data.

-- Step 1: I find the total sales and number of customers by sales channel
SELECT
  s.channel,
  COUNT(DISTINCT s.customer_id) AS customers,
  SUM(s.total_price) AS income
FROM sales s
GROUP BY s.channel
ORDER BY income DESC;


-- Step 2: I find a customer acquisition pattern, i.e. I look at the number of new customer registrations by month
SELECT 
    EXTRACT(MONTH FROM registration_date) as month_number,
    COUNT(customer_id) as new_customers
FROM customers
GROUP BY month_number
ORDER BY month_number;
