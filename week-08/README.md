## Week 8: Automated ETL pipeline

The goal of Week 8 was to move from static analysis to a dynamic and automated system. Together with the team, we created a complete pipeline for UrbanStyle, which replaces the manual work that previously took four hours a week with an automated process measured in seconds.

### My role – Data fetching (EXTRACT)
My task in the team was to create the `data_fetcher.py` module, which is responsible for retrieving data directly from the Supabase REST API.

**Main activities and responsibilities:**
* **Creating an API connection:** I set up a secure connection using the Supabase SDK, ensuring that sensitive API keys are isolated in a `.env` file and do not leak to GitHub.
* **Dynamic filtering:** I developed the `fetch_sales` and `fetch_customers` functions, which allow you to fetch data according to the desired date range (with the `--start-date` and `--end-date` arguments).

### Team results summary
The team's work resulted in a complete `pipeline.py` that connects all ETL stages:

1. **EXTRACT:** My module retrieves fresh sales and customer data.
2. **TRANSFORM:** Data is cleaned of duplicates (e.g., more than 5,000 duplicate rows were removed) and critical KPIs are calculated.
3. **LOAD:** Results are automatically exported to time-stamped CSV files and interactive Plotly graphs (HTML) are created.

The system is "production-grade", including detailed logging (`pipeline.log`) and data quality checks at each stage.

### Using AI
**How ​​did AI help this week?**
I used artificial intelligence to debug the coordinates of the Plotly visualization (especially when setting the `domain` parameter) and to check the syntax of the Pandas aggregation functions.