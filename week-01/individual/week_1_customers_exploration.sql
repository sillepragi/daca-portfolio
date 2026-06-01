-- Week: 0            Department: Marketing analytics            Role: Customer data explorer

/*
TASK: 
Which customers are in the UrbanStyle database?
Examine the customers table:
How many customers are there?
Which cities are represented?
Are there duplicate emails?
When did the customers register?

OUTPUT:
3-5 SQL queries (saved as .sql file).
Screenshot or summary of each query result.
Short summary: What did I find?
*/


-- I find the total number of customers
SELECT COUNT (*) AS number_of_customers
FROM customers;
-- There are 3150 customers in total


-- I view the column structure of the customers table
SELECT *
FROM customers
LIMIT 10;
-- The table has 9 columns: customer_id, first_name, last_name, email, phone, city, registration_date, loyalty_tier and birth_year


-- I find out how many different cities there are
SELECT distinct city
FROM customers;
-- 12 cities are represented (there are duplicates of cities because the cities have different formats - uppercase, lowercase, spaces, etc., which is why the query does not return the correct result)


-- I find clients in a specific city
SELECT *
FROM customers
WHERE city = 'Tallinn'
ORDER BY last_name ASC
LIMIT 15;
-- This query does not return the desired result because the city names are in different formats


-- Checking the registration dates
SELECT
  MIN(registration_date) AS oldest,
  MAX(registration_date) AS newest
FROM customers;
-- The first customer registered on 02.01.2020 and the last on 27.02.2025


-- Checking for missing values
-- Customers with missing first name.
SELECT COUNT (*) - COUNT (first_name) AS missing_first_name
FROM customers;
-- No customer's first name is missing


-- Customers with missing email
SELECT COUNT (*) - COUNT (email) AS missing_email
FROM customers;
-- 380 customer emails are missing


-- I find duplicate emails
SELECT
  COUNT (*) AS total_emails,
  COUNT (DISTINCT email) AS unique_emails,
  COUNT (*) - COUNT (DISTINCT email) AS duplicate_emails
FROM customers;
-- There are 3150 emails in total, 2640 unique emails, so there are 510 duplicate emails


-- I count customers by city
SELECT city,
COUNT (*) AS number_of_customers
FROM customers
GROUP BY city
ORDER BY number_of_customers DESC;
-- This query does not return the desired result because the city names are in different formats


-- I find registrations from the last 6 months
SELECT *
FROM customers
WHERE registration_date >='2024-07-01'
ORDER BY registration_date DESC;
-- Total of 425 registrations in 6 months

/* 
SUMMARY
There are a total of 3150 customers in UrbanStyle. 12 different cities are represented: Tallinn, Tartu, Pärnu, Narva, Viljandi, Rakvere, Valga, Kuressaare, Haapsalu, Jõhvi, Võru, Paide.
While analyzing the data, I noticed quite a few problems. First, the names of the cities are in different formats in the table and I could not get the number of cities represented using the query. For example, the city of Tartu has been entered in both lowercase and uppercase letters throughout, as well as with a capital letter or there are spaces before Tartu. This causes problems both with filtering customers from a specific city and with counting customers based on cities. Also, 380 customers e-mails are missing from the customers data and there are a total of 510 duplicate e-mails.

CONCLUSION
The data in the city and email columns of the customers table needs to be cleaned.
*/