# Week 4: SQL aggregation — From numbers to business decisions

## What I did
- Learned to use the `GROUP BY` statement to sort thousands of UrbanStyle sales rows into logical units by month, city, and product category.
- Calculate KPIs: Implemented basic aggregate functions (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`) to find key business metrics such as total revenue, average order value (AOV), and number of unique customers.
- Used the `HAVING` filter to find discrepancies in data, such as products where the difference between system and physical inventory was unnaturally large.
- Implemented CTEs (Common Table Expressions), which made complex multi-step queries (e.g. sales trends by location) readable and easy to manage.
- I learned to use window functions (`OVER`, `ROW_NUMBER`, `LAG`) to create a ranking (TOP 3 products in a category) and calculate monthly growth compared to the previous period.
- I participated in a team project where I analyzed aggregate sales data and created a sales statistics report.
- I documented my weekly work in a GitHub portfolio.

## Key lessons
- I understood that the database filters rows (`WHERE`) before grouping, but groups (`HAVING`) only after calculating the aggregate data.
- I learned how aggregate functions deal with missing data (e.g. `AVG` ignores NULLs) and how to use `COALESCE` to ensure the reliability of calculations.
- I learned to distinguish between `GROUP BY` logic (which aggregates details into one row) and window functions (which add an aggregate value to each row while maintaining the detailed view).

## Using AI
I used NotebookLM and ChatGPT as a personal study companions to gain a deep understanding of the complex logic of SQL window functions and CTEs. AI helped me debug queries and verify that `OVER()` and `PARTITION BY` functions were calculating city sales shares correctly.

## Files
- **[week4_sales_aggregation.sql](individual/week4_sales_aggregation.sql)** – Sales aggregate SQL queries with explanatory comments

## Team work
- **[week4_team_aggregation_report.md](team/week4_team_aggregation_report.md)** – Team aggregate report