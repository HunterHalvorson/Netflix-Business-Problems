# 🎬 Netflix Content Analysis — SQL Project

Exploratory data analysis of Netflix's content library using **PostgreSQL**, focused on solving real business problems through structured querying.

---

## 📌 Project Overview

This project analyzes a Netflix dataset to uncover insights about content distribution, regional trends, and catalog composition. Each query is written to answer a specific business question a data analyst or product team might face.

---

## 🛠️ Tools & Technologies

- **Database:** PostgreSQL
- **Language:** SQL
- **Dataset:** Netflix Movies and TV Shows (Kaggle)

---

## 📂 Project Structure

```
netflix-sql-analysis/
│
├── README.md
├── dataset/
│   └── netflix.csv
│
└── solutions/
    ├── 01_content_type_count.sql
    ├── 02_top_countries.sql
    ├── 03_recent_additions.sql
    ├── 04_multi_country_analysis.sql
    ├── 05_content_categories.sql
    └── ...
```

---

## 🔍 Business Problems Solved

| # | Business Question | Concepts Used |
|---|-------------------|---------------|
| 1 | How many Movies vs TV Shows are on Netflix? | `COUNT`, `GROUP BY` |
| 2 | Which are the top 5 countries producing the most content? | `RANK()`, subquery |
| 3 | What content was added in the last 5 years? | `TO_DATE`, `INTERVAL` |
| 4 | How can we analyze content listed under multiple countries? | `UNNEST`, `STRING_TO_ARRAY` |
| 5 | How much content contains violent keywords in its description? | `CASE`, `ILIKE` |

---

## 💡 Key SQL Concepts Demonstrated

- Window functions — `RANK() OVER(PARTITION BY ... ORDER BY ...)`
- String manipulation — `UNNEST`, `STRING_TO_ARRAY`, `ILIKE`, `LIKE`
- Date functions — `TO_DATE`, `CURRENT_DATE`, `INTERVAL`
- Conditional logic — `CASE WHEN ... THEN ... ELSE ... END`
- Subqueries and aliasing
- Aggregations — `COUNT`, `GROUP BY`

---

## 📊 Sample Insight

> Out of 8,000+ titles, the majority of Netflix content is Movies. The USA dominates production volume, followed by India and the UK. A small but notable portion of content contains keywords associated with violence in their descriptions.

---

## 🚀 How to Run

1. Clone this repo
2. Import `dataset/netflix.csv` into a PostgreSQL database
3. Run any `.sql` file from the `solutions/` folder in your SQL client (pgAdmin, DBeaver, etc.)

---

