# TECHNICAL PEER REVIEW: UrbanStyle Data analyst candidate

**Portfolio to be assessed:** Role C, Sandra
**Evaluator:** Role B, Sille (Technical Interviewer)
**Date:** May 27, 2026

---

## 1. Code quality (readability, comments, structure)
The candidate has moved from basic knowledge acquisition to full professional independence.

* **SQL:** Queries are structured correctly, using uppercase for command words (`SELECT`, `FROM`, `WHERE`), which makes the code readable according to standards. The use of **CTEs (Common Table Expressions)** in more complex queries is particularly striking, which shows the ability to break down the code into logical parts.
* **Python:** Scripts are logical and modular. The use of functions (e.g. `fetch_sales()`, `calculate_rfm()`) indicates good engineering thinking and code reusability.
* **Code readability and documentation:** The candidate's code is documented in an exemplary manner. Of particular note is the fact that each step of the code is provided with an explanatory comment, which makes the data processing logic transparent and easily auditable.
* **Variable naming:** The candidate uses descriptive variable names (e.g. `df_sales` or `rfm_table`), avoiding notations such as `x` or `data`. This practice ensures code sustainability and makes team collaboration more effective.

## 2. Tool knowledge
The candidate has demonstrated proficiency in the tools needed to solve UrbanStyle's data chaos:

* **SQL:** Proficient in data cleansing (`DELETE` for duplicates, `COALESCE` for NULLs) and complex aggregation (**Window Functions**).
* **Python/Pandas:** Able to perform **RFM analysis**, working with large DataFrames.
* **Visualization:** Uses Power BI to create interactive filters, following the **Data-Ink Ratio** principles.
* **Git:** Able to manage code versions and has made regular commits.

## 3. Documentation quality
Documentation is an area where the candidate has demonstrated accuracy:

* **README files:** Project READMEs do not just describe the code, but translate technical results into business insights.
* **Audit log:** There is a clear trace of the data cleansing process.
* **Commit messages:** Commit messages describe precisely the actions taken, following professional standards.

## 4. Strengths and improvement suggestions

### **3 Strengths:**
1. **Business focus:** The candidate does not simply present numbers, but provides actionable recommendations (e.g., which campaigns should be run for specific segments).
2. **Automation capability:** Building a Python API-based pipeline demonstrates a systems mindset.
3. **Data quality control:** Ability to detect and fix **5000+ duplicates** in the sales table without corrupting the original data.

### **2 Suggestions for improvement:**
1. **Portfolio Structure Standardization:** I recommend standardizing the naming style of the GitHub repository directories (for example, replacing `week_3` with a uniform format like `week-03`) for systematic sorting.
2. **Standardized Folder Structure:** A uniform structure makes navigating the portfolio faster and gives a more professional impression.

## 5. Hiring Recommendation: YES
**Reason:** The candidate has demonstrated full readiness to independently solve UrbanStyle's data problems. His ability to combine technical accuracy (SQL/Python) and business storytelling makes him a valuable candidate. I recommend hiring the candidate because their portfolio demonstrates the ability to draw data-driven conclusions and solve business problems.