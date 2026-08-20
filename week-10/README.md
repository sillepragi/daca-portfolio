# Week 10: UrbanStyle synthesis analysis & Portfolio defense

Welcome to the culmination of my 11-week DACA (Data Analyst Career Accelerator) journey. This repository represents my transition into the program, where I synthesized all technical skills acquired—ranging from raw SQL data surgery to automated Python ETL pipelines and interactive dashboards—to solve critical business challenges for **UrbanStyle.ltd**.

---

## 1. The business challenge & context

**UrbanStyle.ltd** is a rapidly growing Estonian fashion retailer operating on a dual-channel model (60% online and 40% across three physical stores in Tallinn, Tartu and Pärnu). While the company’s revenue surged by 150% over two years to approximately €3 million, this hyper-growth resulted in massive **data chaos**. 

The company's three core systems—e-commerce, physical POS, and Excel-based inventory management—were completely siloed, leaving the database riddled with duplicates, NULL values and transaction inconsistencies. 

**The Crisis:** CEO Kristi Tamm was in negotiations with investors to secure a **€500,000 growth investment** to expand operations. However, the investors demanded a 100% reliable, data-driven business plan. My role as the Data Analyst was to clean the data, dismantle the silos and build an audited, automated decision-support system to validate our revenue and uncover strategic growth drivers.

---

## 2. Synthesis insights

By performing cross-week data synthesis and querying across multiple tables, I uncovered several high-impact insights that were previously hidden in the data silos:

*   **The power of the VIP Champions (N7 + N4 Synthesis):** Using Python and RFM (Recency, Frequency, Monetary) modeling, I identified **245 "VIP Champions"** (representing 10% of the customer base) who generate an astonishing **42% of UrbanStyle’s total revenue**.
*   **At-Risk Churn & Return Risks (N7 + N5 Synthesis):** The "At-Risk" segment (180 high-value customers who haven't made a purchase in months, representing a €45,000 churn risk) showed a heavy correlation with product categories suffering from the company's highest return rate of **28%**. This indicated that customer drop-off was driven by product quality or sizing issues in specific categories rather than general disinterest.
*   **The Green Premium (N3 + N4 Synthesis):** Eco-certified products (`eco_certified`) maintain a **15% higher average retail price** than non-certified products. Furthermore, they are the fastest-growing category among VIP Champions, mathematically validating Kristi's sustainability vision as a highly profitable competitive edge.

---

## 3. Strategic & actionable recommendations

Based on the synthesized data, I proposed the following strategic actions to the executive board:

1.  **Inventory optimization (Impact: €18,000 annual savings):**
    *   Increase the inventory level of VIP-preferred eco-certified items by **15%** (low return risk).
    *   Reduce stock allocation for product lines heavily tied to the "At-Risk" segment and initiate a quality control audit with those suppliers (due to the 28% return rate).
2.  **Targeted Win-Back Campaigns (Impact: 3.2x Marketing ROI):**
    *   Deploy a personalized "Win-Back" email sequence to the At-Risk segment, offering a time-limited 15% discount code tailored to their historically preferred product categories.
    *   Protect profit margins by avoiding blanket store-wide discounts, shifting instead to exclusive loyalty rewards (free shipping, early access) for VIP Champions.

---

## 4. Technical architecture & journey

My growth followed the martial arts progression model, shifting from strictly following rules to building robust, production-grade automated systems:

| Phase | 1. Extract & Clean | | 2. Analyze & Model | | 3. Visualize & Present | | 4. Automate |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Technology** | **PostgreSQL (SQL)** | ➔ | **Python (Pandas)** | ➔ | **Power BI / Plotly** | ➔ | **GitHub Actions** |

### 1. First phase: Extract & Clean (SQL)
*   **Tools:** PostgreSQL, Supabase.
*   **Implementation:** Conducted a comprehensive database health audit. I identified and removed **5,116 duplicate transaction rows** from the `sales` table. This crucial database surgery prevented a catastrophic **€1.4 million revenue overstatement** in the financial reports before they reached investors.

### 2. Second phase: Analyze & Model (Python)
*   **Tools:** Python, Pandas, NumPy, Jupyter Notebooks.
*   **Implementation:** Developed a custom, reproducible RFM segmentation engine. I converted dates into active timestamps, handled missing customer data (`COALESCE` logic translated to Pandas), and partitioned scores using quintiles to classify the entire customer base into 5 actionable segments.

### 3. Third phase: Visualize & Storytell (Interactive dashboards)
*   **Tools:** Plotly Express, Streamlit, Power BI.
*   **Implementation:** Designed interactive dashboards adhering strictly to Edward Tufte’s "data-ink ratio" and Cole Nussbaumer Knaflic’s "Storytelling with Data" principles. I implemented custom annotations (e.g., highlighting the December holiday sales spike) and reference lines to answer the CEO's critical questions in under 3 seconds.

### 4. Fourth phase: Automate
*   **Tools:** Python, REST APIs, Git/GitHub, GitHub Actions.
*   **Implementation:** Replaced manual CSV exports with a fully automated, API-driven ETL pipeline. It runs every Monday at 9:00 AM via GitHub Actions, performing database health checks, recalculating RFM scores, and exporting an updated campaign-ready CSV. This automation **saves UrbanStyle 200 hours of manual labor per year** while boosting data accuracy to **99.8%**.

---

## 5. Portfolio defense pitch (STAR Method)

*   **Situation:** UrbanStyle was seeking €500,000 in kasvurahastus, but silod and severe data quality issues (duplicates, NULLs) made the financial and customer data completely unreliable for investor auditing.
*   **Task:** My objective was to audit and clean the database, validate the actual revenue, segment the customer base to prove brand retention, and automate the process for future scalability.
*   **Action:** I performed rigorous SQL cleanups to eliminate 5,116 duplicates (saving a €1.4M reporting error), built a Python RFM segmentation model, constructed an interactive investor dashboard and automated the entire workflow in GitHub Actions using secure environment variables.
*   **Result:** I successfully verified our true €2.8M revenue, identified the 245 VIP Champions driving 42% of our sales and built an ETL pipeline saving 200 hours annually. The automated, audited data story provided Kristi with the exact leverage needed to secure the €500,000 investment.

---

## AI attribution & ethics

Throughout this project, I used AI assistants (ChatGPT and NotebookLM as Gemini Notebook now) to accelerate development. Specifically, AI assisted in debugging complex Pandas `qcut` edge cases (e.g., handling duplicate bin edges with `rank(method='first')`), optimizing the GitHub Actions YAML workflow syntax and refining the narrative flow of my presentations. Every line of code and generated insight was manually audited, tested and validated against the PostgreSQL schema and raw datasets to guarantee 100% accuracy.

---

## Reflection & personal growth

This 11-week accelerator has reshaped my professional identity. Moving from Week 0 with zero knowledge of Gits, pipelines or database schemas to Week 10 as a portfolio-ready analyst has been transformative. I have learned that data analytics is not merely about writing code; it is about acting as a translator between technical infrastructure and business value. I can now speak "code" with IT Director and "revenue and ROI" with CEO.