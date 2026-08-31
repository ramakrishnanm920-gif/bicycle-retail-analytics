<img width="929" height="260" alt="image" src="https://github.com/user-attachments/assets/5b64c251-656f-45e0-8e37-0174ec8d7e5b" /># 
# Bicycle Retail Business Analytics 
End-to-end data analytics project on a bicycle retail dataset — from raw data cleaning to an interactive dashboard — covering Excel, SQL, Python, and Power BI. Completed as part of a certified analytics training program.
Overview
This project analyses sales, customer, and product data from a bicycle retail business (`bicycle_retail` database) to uncover sales trends, segment customers, and support data-driven business decisions. The workflow moves through four stages, each handled with a different tool.
Tools & Skills
 Stage | Tool | Key Techniques 
 Data Cleaning & Prep | Excel | VLOOKUP, Pivot Tables, IQR Outlier Detection |
| Data Querying | SQL (MySQL Workbench) | INNER JOINs, Aggregations (SUM, COUNT, AVG, GROUP BY) |
| Analysis & Segmentation | Python (Pandas) | EDA, RFM Segmentation (`pd.qcut()`) |
| Visualisation | Power BI | KPI Cards, Line Charts, Maps, Slicers |
Excel — Data Cleaning & Preparation :
- Cleaned raw sales data: handled missing values, standardised formats
- Merged related data tables using VLOOKUP
- Built pivot tables to summarise sales by category, region, and time period
- SQL — Data Querying
  Wrote 15+ queries against the `bicycle_retail` relational database in MySQL Workbench
- Used INNER JOINs to combine data across customers, orders, and products tables
- Built aggregation queries (SUM, COUNT, AVG, GROUP BY) to answer business questions on sales performance and customer    activity
Python — Exploratory Analysis & Customer Segmentation 
Performed exploratory data analysis (EDA) in Google Colab with visualisations to surface trends and patterns in the data
- Built an RFM (Recency, Frequency, Monetary) model using `pandas`, scoring customers with `pd.qcut()`
- Segmented customers into actionable tiers (e.g. high-value, at-risk, new) to support targeted marketing decisions
- Power BI — Dashboard & Visualisation
Designed an interactive dashboard with 14 visualisations, including KPI cards, line charts, and maps
- Added slicers for dynamic filtering by region, time period, and customer segment
- Delivered a consolidated view of sales performance and customer segments for decision-making
Key Takeaways

- Combined structured querying (SQL), statistical analysis (Python), and visualisation (Power BI) into a single end-to-end analytics workflow
- Used RFM segmentation to translate raw transaction data into actionable customer tiers
- Built a multi-page interactive dashboard to communicate insights to non-technical stakeholders

---
**Author:** Ramakrishnan
**Background:** Quality Analyst transitioning into Data Analytics


