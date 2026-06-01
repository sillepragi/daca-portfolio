# Teamwork summary: Week 3 — Data join (JOIN)
**Department:** UrbanStyle Marketing analytics department

### 1. Key findings

#### Connecting Sales and Customers (TOP Customers)
* **TOP Customers:** We identified UrbanStyle’s customers with the highest total sales, meaning that a small number of customers generate a disproportionately large share of the company’s total sales.
* **Regional Market:** Tallinn is by far the main market (€1 006 252 and 3601 purchases) where it makes sense to direct additional resources.
* **Loyalty Program Anomaly:** The most profitable loyalty group is currently customers who **lack a level** (€1 071 805). This indicates a great potential to attract valuable customers to the official loyalty program.
* **Segmentation:** There are 762 above-average spenders, or just **7.53%** of all customers.

#### Identifying "lost customers"
* **Potential:** We found a total of **599 lost customers** (registered but not purchased). This is critical unrealized sales potential.
* **Location:** 60.8% of lost customers are located in our main markets: Tallinn (231) and Tartu (133).
* **Communication capability:** 86.8% (520 customers) have an email, which allows for an immediate welcome campaign (e.g. -15% discount coupon).
* **Activity:** 65.6% of them registered only in the last two years (2024–2025), so the hope of getting in touch with them again is high.

#### Unsold products and inventory analysis
* **Data quality:** I identified 12 products that have no sales history. It turned out that these are **duplicate entries** in the products table.
* **Stock:** The stock of 231 products out of 1400, or 16.5%, is below the critical limit. There is negative stock.

#### Sales channel efficiency analysis
* **Channel strength:** Physical stores generate ~60% (1.9M €) and the online store ~40% (1.0M €) of turnover. Stores are currently the most efficient channel.
* **Efficiency:** The average sales per customer are significantly higher in physical stores (**835.13 €**) than in the online store (**590.12 €**).
* **Expansion:** It is recommended to consider opening a new store in Narva in the future, as there is already an existing interest in UrbanStyle products among the people of Narva.

---

### 2. Biggest surprises in the analysis
1. **Spiritual customers:** There are a total of 599 lost customers, which constitutes a full **19%** of the entire customer base.
2. **Product errors:** 12 duplicate products, which directly affect the reliability of inventory.
3. **Store dominance:** Despite the digital age, the physical store continues to be the most effective sales channel.
4. **Overselling:** 10 products have been oversold (stock has gone into the red).

---

### 3. Recommendations for marketing
* **Welcome campaigns:** Launch an e-mail campaign for 520 lost customers.
* **TOP customers:** Create special offers for our gold customers.
* **Store campaigns:** Use "buy 2, get 3" style campaigns in physical stores to further increase the already high average purchase.
* **Online growth:** We need to increase e-store sales through targeted online campaigns.
* **New store:** Start preparations for opening a physical store in Narva.

---

### 4. Missing data and further questions
* **Returns:** Why are there prices with a minus sign in the data? We need to clarify whether these are returns or data errors.
* **Loyalty tier logic:** Why do the highest sales come from customers without a level? We need to understand how the system determines the levels and whether we should manually move these valuable customers to the "Gold" level.