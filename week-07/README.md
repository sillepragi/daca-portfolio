## Week 7: Python Pandas — RFM Customer segmentation

### My role
My focus was on visualizing RFM analysis results and telling the data story. I used the Plotly library to transform technical calculations (R, F, M scores) into understandable business insights. I focused on making sure that technical RFM scores were not just numbers, but had concrete business meaning. My role was to ensure that the graphs answered the question “So what?”, helping to visually identify the most valuable customers and those at risk of losing them.

### Key findings
- **High impact of VIP customers:** The analysis confirmed that a small group of VIP Champions (score 13-15) generate a disproportionately large portion of UrbanStyle’s total revenue, being a critical target group for maintaining loyalty.
- **High-value inactive customers:** We identified a significant At-Risk segment, which includes customers with high frequency and spend in the past, but who have not purchased in recent months. As a result of this discovery, targeted "win-back" campaigns can be launched.

### Using AI
I used AI to explain several functions and methods. For example, to explain the syntax of the `pd.qcut()` function and the `rank(method='first')` method to solve errors related to repeated values ​​in frequency scoring. AI also helped to understand in depth why Recency scoring is reversed — a lower number of days since the last purchase should give a higher score (5) to reflect the freshness of the customer. I also added explanatory annotations to the graphs with the help of AI.

## Files
- **[week7_rfm_visualization.ipynb](individual/week7_rfm_visualization.ipynb)** – group work subtask role D code
- **[fig_1_screenshot.png](individual/fig_1_screenshot.png)** – screenshot of subtask role D diagram no. 1
- **[fig_2_screenshot.png](individual/fig_2_screenshot.png)** – screenshot of subtask role D diagram no. 2
- **[fig_3_screenshot.png](individual/fig_3_screenshot.png)** – screenshot of subtask role D diagram no. 3

## Teamwork
- **[week7_rfm_complete.ipynb](team/week7_rfm_complete.ipynb)** – complete team notebook