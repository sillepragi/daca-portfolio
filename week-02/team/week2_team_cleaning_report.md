# Team summary report: Week 2 — Data cleanup
**Department:** UrbanStyle Marketing analytics department

## 1. Sales table
**5509 problematic rows** were identified. In business terms, this translates to three types of data quality issues that distort UrbanStyle’s total revenue and require immediate intervention.

| Category | Issues Found | Description |
| :--- | :---: | :--- |
| Duplicates | 4013 | Duplicate `sale_id` values ​​(distort total revenue) |
| NULL customer_id | 1487 | Missing customer reference (prevents customer analysis) |
| NULL sale_date | 0 | 🟢 Data OK |
| NULL total_price | 0 | 🟢 Data OK |
| Future Dates | 9 | Date > today (logic errors) |
| **TOTAL** | **5509** | **Duplicate records and logic errors** |

### Priority order and business impact
1. **Missing ``customer_id``:** (HIGH) – Cannot link customer to sales, making it impossible to analyze loyalty programs.
2. **Duplicates:** (MIDDLE to HIGH) – Creates an unreliable picture of total sales, a critical error for investors.
3. **Future dates:** (LOW) – Small number, easy to fix, does not affect the big picture.

---

## 2. Customers table
**562 problematic rows** were identified. Customers with missing emails are essentially anonymous customers, for whom it is not clear how many of them are different people and who cannot be notified by email, among other things. Customers with duplicate emails distort statistics about the number of customers who have made purchases, and for example, how many customers there actually are in different cities.

| Category | Problems found | Description |
| :--- | :---: | :--- |
| Duplicate emails | 128 | Same email for multiple customers (distorts the number of customers) |
| NULL first name/last name | 0 | 🟢 Data OK |
| Inconsistent city names | 54 | Different forms of names (e.g. tallinn vs. Tallinn) |
| NULL email | 380 | Missing contact information (anonymous customers) |
| **TOTAL** | **562** | |

---

## 3. Products table
**12 problematic rows** were identified. The biggest obstacle to product analysis is the duplication of product names.

| Category | Problems found | Description |
| :--- | :---: | :--- |
| Duplicate names | 12 | Same product name occurs multiple times |
| NULL name/price | 0 | 🟢 Data OK |
| Logical errors | 0 | 🟢 No negative or extreme prices |
| Inconsistent categories | 0 | 🟢 Category name forms are consistent |
| NULL category | 0 | 🟢 Classification is complete |
| **TOTAL** | **12** | |

---

## 4. Quality control
**1268 problematic rows** were identified. The most critical is the price inconsistency between tables.

| Category | Problems found | Description |
| :--- | :---: | :--- |
| Orphan customers | 0 | 🟢 All sales refer to an existing customer |
| Orphan products | 0 | 🟢 All sales refer to an existing product |
| **Price inconsistencies** | **664** | **Sales price does not match product price** |
| Spirit customers | 592 | Customers who have never purchased |
| Spirit products | 12 | Products that have never been sold |
| **TOTAL** | **1268** | |

---

## 5. Summary and recommendations

### Biggest surprise
* **664 price difference:** The discrepancy between sales data and product data indicates a serious error between the tables.
* **Duplicate sales data:** These significantly affect UrbanStyle's total turnover and need to be removed immediately.

### Recommendations for further action
1. **Data cannot be trusted at this time:** A full cleanup must be performed first.
2. **Priority:** Start cleaning duplicates in the sales and product data tables.
3. **Investigation:** Identify the root cause of the price discrepancy (664 records) – is the error in the product price or the sales amount?
4. **Start by cleaning up duplicates**