# Design decisions: UrbanStyle investor dashboard (Week 5)

This document explains the design decisions made when creating the prototype of the UrbanStyle.ltd investor dashboard. The dashboard aims to answer four key questions for the CEO.

## 1. Layout and hierarchy (F-pattern)
The dashboard is structured following the natural reading pattern of the human brain (F-pattern), where the most important information is located at the top left.

* **Top row (KPI cards):** The four main metrics are displayed (Total Revenue, Number of Customers, AOV, Growth %). These are the main numbers that provide an immediate overview of the state of the company.
* **Middle area:** The sales trend line chart covers the largest area, as it answers the CEO's most critical question: "Are we growing or dying?".
* **Bottom area:** Supporting charts (products and locations) are placed side by side to provide more detailed insight without distracting from the main focus.

## 2. Choice of chart types
Each chart is chosen based on the type of data and business purpose:

* **Line chart (Sales trend):** Selected to show the trend over time. The line connects the points, allowing the eye to instantly identify growth and seasonality (e.g., the December peak).
* **Horizontal bar chart (Sales channels):** A bar chart is the best choice for comparing sales channels, as the human eye can distinguish and compare bar lengths much more accurately than, for example, the angles or areas of a pie chart.
* **Piston chart (Locations):** Used to show the proportion of the whole. Since there are few categories, this view is clear and intuitive.

## 3. Color psychology and consistency
I used the official UrbanStyle stylebook to create a professional and reliable image:

* **Navy (#1A1A2E):** To indicate the flagship store in Tallinn and positive growth. This reflects the brand's focus on sustainability.
* **Teal (#009B8D):** To indicate channels.
* **Grayscale:** For less important or smaller locations (Pärnu) to reduce visual noise and keep the focus on what is important.

## 4. Text alignment and "Data-Ink Ratio"
I followed Edward Tufte's principle, where every pixel should convey information:

* **Title alignment:** All titles are aligned to the left. This matches the Z-reading pattern and creates a clean vertical line.
* **Noise reduction:** Excess gridlines (gridlines) and 3D effects that would distort the perception of the data have been removed.

## 5. Interactivity (cross-filtering)
The dashboard supports cross-filtering. For example, by clicking on the Tallinn sector, all other graphs will be filtered to show only Tallinn data in real time.

## 6. Summary
The dashboard is ready, interactive, and optimized for quick business decisions.