# Walmart-Sales-Insights-SQL-Project-

# Walmart Sales Insights (SQL Project)

## 📌 Project Overview
This project analyzes **Walmart sales data** to gain insights into:
- High-performing branches and products  
- Sales trends and seasonal patterns  
- Customer behavior and preferences  

The objective is to support **data-driven decision-making** and optimize Walmart’s sales strategies.  

Dataset source: [Kaggle - Walmart Sales Forecasting Competition] (https://www.kaggle.com/competitions/walmart-recruiting-store-sales-forecasting)

---

## 🎯 Purposes of the Project
- Identify **top-performing product lines** and underperforming ones  
- Analyze **customer segments** and purchasing trends  
- Explore **sales behavior** by time, day, and month  
- Provide actionable insights for **business growth**  

---

## 🗂️ About the Data
The dataset contains **1,000 rows and 17 columns** from 3 Walmart branches in Myanmar: **Mandalay, Yangon, and Naypyitaw**.

| Column Name        | Description                                  | Data Type         |
|--------------------|----------------------------------------------|------------------|
| invoice_id         | Invoice of the sales made                   | VARCHAR(30)      |
| branch             | Branch at which sales were made             | VARCHAR(5)       |
| city               | Location of the branch                      | VARCHAR(30)      |
| customer_type      | Type of the customer                        | VARCHAR(30)      |
| gender             | Gender of customer                          | VARCHAR(10)      |
| product_line       | Product line of the product sold            | VARCHAR(100)     |
| unit_price         | Price of each product                       | DECIMAL(10,2)    |
| quantity           | Number of products sold                     | INT              |
| VAT                | Value Added Tax on purchase                 | FLOAT(6,4)       |
| total              | Total cost of the purchase                  | DECIMAL(12,4)    |
| date               | Date of transaction                         | DATETIME         |
| time               | Time of transaction                         | TIME             |
| payment            | Payment method                              | VARCHAR(15)      |
| cogs               | Cost of Goods Sold                          | DECIMAL(10,2)    |
| gross_margin_pct   | Gross margin percentage                     | FLOAT(11,9)      |
| gross_income       | Gross income                                | DECIMAL(12,4)    |
| rating             | Customer rating                             | FLOAT(2,1)       |

---

## 🛠️ Approach
1. **Data Wrangling**
   - Created database & tables  
   - Checked for NULL values (none due to NOT NULL constraints)  

2. **Feature Engineering**
   - Created `time_of_day` (Morning, Afternoon, Evening)  
   - Extracted `day_name` (Mon-Sun)  
   - Extracted `month_name` (Jan-Dec)  

3. **Exploratory Data Analysis (EDA)**
   - Answered business questions related to product, sales, and customer behavior  

---

## 📊 Business Questions Answered

### Product Analysis
- How many distinct product lines exist?  
- What is the most selling product line?  
- Which product line generated the **highest revenue**?  
- Which product line incurred the **highest VAT**?  
- Average rating per product line  

### Sales Analysis
- Which month recorded the **highest COGS**?  
- Which city has the **highest revenue**?  
- What is the revenue trend across **time of day**?  
- Which customer type pays the most VAT?  

### Customer Analysis
- How many unique customer types?  
- What is the most common payment method?  
- Which gender dominates purchases?  
- Gender distribution per branch  
- Which day/time customers give **highest ratings**?  

---
