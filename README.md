# Customer Shopping Behavior Analytics — SQL · Python · Power BI

An end-to-end retail analytics project that explores customer transaction data using **SQL** for querying, **Python** for exploratory analysis, and **Power BI** for interactive dashboards. The goal is to uncover revenue trends, segment customers, and surface actionable business insights from raw shopping data.

## Overview

Working from a transactional dataset (~3,900 customer records, 18 attributes), this project answers 10+ business questions covering revenue by gender, discount effectiveness, customer segmentation (new / returning / loyal), shipping comparisons, top products by category, and subscription behavior.

## Tech Stack

| Layer | Tools |
|---|---|
| **Data storage / querying** | PostgreSQL / MySQL (SQL) |
| **Analysis & visualization** | Python (pandas, matplotlib, seaborn) |
| **Dashboarding** | Power BI |
| **Notebook** | Jupyter |

## Dataset

`customer_shopping_behavior.csv` — 3,900 rows × 18 columns

**Columns:** Customer ID, Age, Gender, Item Purchased, Category, Purchase Amount (USD), Location, Size, Color, Season, Review Rating, Subscription Status, Shipping Type, Discount Applied, Promo Code Used, Previous Purchases, Payment Method, Frequency of Purchases

## Business Questions Answered

1. **Total revenue** — male vs female customers
2. **High-value discount users** — discount-applied customers who still spent above the mean
3. **Top 5 products** by average review rating
4. **Shipping comparison** — average spend on Standard vs Express
5. **Subscriber spend** — average spend and total revenue for subscribers vs non-subscribers
6. **Top 5 products** with the highest discount rate
7. **Customer segmentation** — New (1 purchase) / Returning (2–10) / Loyal (10+)
8. **Top 3 products per category** (window-functioned ranking)
9. **Repeat-buyer subscription behavior** — do 5+ buyers tend to subscribe?
10. **Age-group revenue contribution** — bucketed by age range

All SQL queries use joins, CTEs, `CASE WHEN` segmentation, `ROW_NUMBER()` window functions, and aggregate functions.

## Power BI Dashboard

The `.pbix` dashboard visualizes:
- KPI cards (total revenue, average order value, customer count)
- Revenue by category and season
- Discount impact on sales
- Top products and customer segments
- Geographic distribution by US state

## File Structure

```
.
├── customer_shopping_behavior.csv         # Raw dataset
├── Customer_shopping_Behavior.sql         # 10+ analytical SQL queries
├── Customer_Shopping_Behavior.ipynb       # Python exploration & visualization
├── customer_behavior_dashboard.pbix       # Power BI dashboard
├── README.md
└── images/
    └── dashboard_preview.png              # Dashboard screenshot
```

## Setup

```bash
git clone https://github.com/Sadman-Rahman25/Customer-Shopping-Behavior-Analytics.git
cd Customer-Shopping-Behavior-Analytics
pip install pandas matplotlib seaborn jupyter
jupyter notebook Customer_Shopping_Behavior.ipynb
```

For SQL queries, load `customer_shopping_behavior.csv` into your preferred SQL engine as a table named `customer`, then run queries from `Customer_shopping_Behavior.sql`.

For the dashboard, open `customer_behavior_dashboard.pbix` in **Power BI Desktop**.

## Key Insights (Sample)

- Subscribers show measurably higher average spend per order despite being a smaller customer share
- Express shipping correlates with higher-value orders, suggesting price-insensitive segments
- Discount-applied purchases above the mean spend reveal a "promo-loyal high-value" segment worth targeting
- Adult age groups (30–50) contribute disproportionately to total revenue

## Author

**S. M. Sadman Rahman** — [GitHub](https://github.com/Sadman-Rahman25) · [LinkedIn](https://www.linkedin.com/in/sadman-rahman-198a88284)

## License

MIT License — see `LICENSE` file for details.
