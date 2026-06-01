# Automated pipeline

## 1. Overview and purpose
This documentation describes a Python-based *ipeline created for UrbanStyle OÜ, which automates the process of collecting, processing and visualizing sales data. The system is designed to move from a manual Excel-based way of working to a dynamic, API-based and scheduleable solution.

The main goal is to provide the company with fresh business data (KPIs, weekly trends), while maintaining the required data quality and security standards.

## 2. Pipeline architecture (ETL)
The system follows the standard **Extract-Transform-Load (ETL)** pattern and is built in a modular way:

| Step | Function in code | Description |
| :--- | :--- | :--- |
| **EXTRACT** | `data_fetcher.fetch_sales`, `fetch_customers` | Retrieves data from Supabase REST API. Supports date-based filtering. |
| **TRANSFORM** | `transform.clean_data`, `calculate_kpis`, `merge_datasets` | Cleans data (duplicates, NULLs), calculates KPIs, and merges tables. |
| **LOAD** | `visualize_export.export_results`, `create_weekly_chart` | Generates Plotly interactive charts (HTML) and saves cleaned data to CSV. |

## 3. Technical requirements
* **Language:** Python 3.13
* **Data Processing:** Pandas
* **Visualization:** Plotly
* **Security:** `.env` file support for storing sensitive API keys (not in the code).
* **Logging:** The `logging` module is used, which records events with timestamps, allowing you to track the success of each step (EXTRACT, TRANSFORM, LOAD).

## 4. Usage and flexibility
Pipeline is controllable via command line arguments, which makes it especially valuable for performing ad-hoc analyses:

**Default launch (all data):**
```bash
python pipeline.py

**Analysis of a specific time period:**
python pipeline.py --start-date=2024-03-01 --end-date=2024-03-31