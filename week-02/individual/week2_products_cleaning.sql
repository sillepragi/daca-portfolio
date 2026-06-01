-- Week: 2          Department: Marketing analytics          Role: Product data cleaner

-- The task is to find duplicates, NULL values, and inconsistencies in the products table and document the problems.
-- The output is a cleanup report (duplicates found, NULLs found, format errors, recommendations) + SQL script.


-- I create a test copy
CREATE TABLE products_test AS
SELECT * 
FROM products;


-- I look how many rows there are in the products_test table - are there the same number of rows as in the products table
SELECT COUNT(*) AS number_of_rows
FROM products_test;

SELECT COUNT(*) AS number_of_rows
FROM products;
-- The created products_test table has a total of 362 rows and matches the number of rows in the products table


-- I find duplicate product names
SELECT 
  product_name, 
  COUNT(*) AS number_of_copies
FROM products_test
GROUP BY product_name
HAVING COUNT(*) > 1
ORDER BY number_of_copies DESC;
-- There are a total of 12 duplicate product names


-- Checking the total number of duplicates -- 12
SELECT COUNT(*) - COUNT(DISTINCT product_name) AS total_number_of_duplicates
FROM products_test;


-- Which specific rows are duplicates
SELECT * FROM (
    SELECT
      product_id,
      product_name,
      category,
      subcategory,
      ROW_NUMBER () OVER (PARTITION BY product_name ORDER BY product_id) AS rn
    FROM products_test
) numbered
WHERE rn > 1;


-- I find NULL values ​​in critical fields
-- First I recall what the columns of the table are to select the critical fields to analyze
SELECT *
FROM products_test
LIMIT 5;


SELECT
    COUNT(*) FILTER (WHERE product_name IS NULL OR product_name = '') AS null_name,
    COUNT(*) FILTER (WHERE category IS NULL OR category = '') AS null_category,
    COUNT(*) FILTER (WHERE cost_price IS NULL) AS null_cost_price,
    COUNT(*) FILTER (WHERE retail_price IS NULL) AS null_retail_price,
    COUNT(*) FILTER (WHERE supplier IS NULL OR supplier = '') AS null_supplier
FROM products_test;
-- I found: 0 NULL names, 0 NULL categories, 0 NULL cost prices, 0 NULL retail prices, 0 NULL suppliers


-- I check for unrealistic prices
-- Are there any negative cost prices
SELECT COUNT(*) AS negative_cost_price
FROM products_test
WHERE cost_price < 0;


-- Are there any negative retail prices?
SELECT COUNT(*) AS negative_retail_prices
FROM products_test
WHERE retail_price < 0;


-- Are there any extreme cost prices (> 1000€)?
SELECT 
  product_name, 
  cost_price
FROM products_test
WHERE cost_price > 1000
ORDER BY cost_price DESC;


-- Are there any extreme retail prices (> 1000€)?
SELECT
  product_name,
  retail_price
FROM products_test
WHERE retail_price > 1000
ORDER BY retail_price DESC;

-- Found: 0 negative prices, 0 extreme prices.


-- I check for consistency of categories (differences in noun form)
SELECT category, COUNT(*) AS number
FROM products_test
GROUP BY category
ORDER BY category;
-- I found: 0 category format errors


/* CLEANING REPORT:
1) 12 duplicate product names
2) 0 NULL values ​​in critical fields
3) 0 negative or extreme prices
4) 0 different category name forms
5) 0 NULL categories
TOTAL 12 problematic values
Product analysis is affected by duplicate product names. Product names need to be cleaned.
*/

-- I START CLEANING THE DATA
-- Cleaning category names
UPDATE products_test
SET category = INITCAP(TRIM(category))
WHERE category != INITCAP(TRIM(category));


-- Check the result
SELECT category, COUNT(*) AS number
FROM products_test
GROUP BY category ORDER BY category;
-- Queries prove once again that there are no differences in the name forms of the categories. So the categories column is clean


-- I clean product_name duplicates in the product_test table
-- I write down the number of rows before deleting -- 362 rows
SELECT COUNT(*) AS before FROM products_test;


-- I delete duplicates (I only keep the first row for each product_id)

--SELECT *
--FROM products_test
DELETE FROM products_test
WHERE product_id NOT IN (
    SELECT MIN(product_id)
    FROM products_test
    GROUP BY product_name
);


-- I check the result
SELECT COUNT(*) AS rows_after FROM products_test;


SELECT 362-350;
-- The products_test table has a total of 350 rows, meaning 12 duplicates have been deleted