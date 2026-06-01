# Team Summary: Week 1 — Data landscape analysis
**Department:** UrbanStyle Marketing analysis department

## 1. Table Overview and Technical Status

### Sales Data
* **Volume:** 15,234 rows and 12 columns.
* **Critical findings:**
* **Missing data:** 1,487 rows are missing customer information (`customer_id` is NULL).
* **Anomalies:** Negative transaction amounts identified, indicating errors or systematic returns.
* **Channel breakdown:** There are 2 unique channels (online and e-store).
* **Location bnalysis:** A total of 3 physical stores (Tallinn, Pärnu, Tartu) and "NULL", which indicates online sales.
* **Duplicate pattern:** 279 duplicate cash payments were detected in Tartu (557 unique invoices vs. 836 transactions). There are an estimated ~5000 duplicates in the entire table.

### Customer data
* **Size:** 3150 rows and 9 columns.
* **Data quality issues:**
* **Different format:** The city names are formatted differently, which creates duplicate aggregate results and prevents accurate filtering.
* **Missing contacts:** 380 customers do not have an email.
* **Duplicates:** 510 duplicate email addresses were detected.

### Product data
* **Size:** 362 rows and 9 columns.
* **Status:** The data is complete, there are no missing values.
* **Prices:** Purchase prices between €10–346; sale prices between €13–434.

## 2. Key findings

* **Biggest surprise:** A NULL value may not always indicate an error, but may carry meaningful information (e.g. `store_location` NULL means online channel).
* **Data chaos:** Currently, UrbanStyle data is unreliable and needs to be cleaned up.

## 3. Decisions and recommendations

1. **Data entry constraints:** Apply `NOT NULL` constraints to critical columns to avoid empty records in the future.
2. **Standardization:** Harmonize text formats (especially city names) and integrate data sources into a single system.
3. **Technical solution for duplicates:** Use unique indexes when adding new data:
`CREATE UNIQUE INDEX sale_id_unique_index ON sales (sale_id);`.
4. **Data cleaning:** Initiate an immediate process of removing duplicates to ensure the accuracy of reports.