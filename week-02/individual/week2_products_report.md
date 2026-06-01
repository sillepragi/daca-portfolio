# UrbanStyle cleanup report: Week 2

## Products data cleanup report

I performed a thorough check on the test table `products_test` and found the following situation:

| Checkpoint | Result | Status |
| :--- | :---: | :--- |
| **1. Duplicate product names** | **12** | 🟢 **Cleaned** |
| 2. NULL values ​​in critical fields | 0 | 🟢 OK |
| 3. Negative or extreme prices | 0 | 🟢 OK |
| 4. Differences in category name format | 0 | 🟢 OK |
| 5. Categories with NULL values ​​| 0 | 🟢 OK |
| **TOTAL ISSUES** | **12** | |

**Conclusion:** Product analysis is mainly affected by duplicate product names.

## Cleanup actions performed

### Duplicate removal
I deleted 12 duplicate rows, keeping only the first occurrence of each product name (based on `product_id`). The result is 350 rows in the products_test table without duplicates. I used the `DELETE` query to do this:

```sql

DELETE FROM products_test
WHERE product_id NOT IN (
    SELECT MIN(product_id)
    FROM products_test
    GROUP BY product_name
);
