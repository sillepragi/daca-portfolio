# Week 2: SQL Cleaning — Cleaning UrbanStyle's data

## What I did
- I learned how to create test copies of tables, how to find and remove duplicates using `GROUP BY` and HAVING filters, and the `ROW_NUMBER()` window function.
- I also learned how to replace missing values ​​(NULL) with replacement text using the `COALESCE` function and the `UPDATE` command.
- I validated data using the `CASE WHEN` function.
- I fixed values ​​with different formats using the `TRIM` and `INITCAP` functions.
- I documented all activities and changes.
- I participated in a team effort where I cleaned up a product data table.
- I formatted my work for the week in a GitHub portfolio.

## Key lessons earned
- I implemented a process of Test, Verify, Log, Commit, which ensures that I never change the original data without verifying and logging it. Before changing the master data, everything must be done in a test_copy.
- The order of execution of the SQL query is as follows: `FROM` -> `WHERE` -> `GROUP BY` -> `HAVING` -> `SELECT` -> `ORDER BY` -> `LIMIT`.

## Files
- **[week2_products_cleaning.sql](individual/week2_products_cleaning.sql)** – SQL queries for cleaning product data with explanatory comments
- **[week2_products_report.md](individual/week2_products_report.md)** – cleaning report

## Teamwork
- **[week2_team_cleaning_report.md](team/week2_team_cleaning_report.md)** – team summary report