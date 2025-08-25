# Walmart Sales Insights (SQL Project)

## 📌 Project Overview
This project analyzes **Walmart sales data** to generate insights about:
- High-performing branches and products  
- Sales patterns across time, day, and month  
- Customer behavior and purchasing trends  

---

## 🗂️ Data Information
The dataset contains **1,000 rows and 17 columns** with sales from 3 Walmart branches (Mandalay, Yangon, Naypyitaw).

Key fields: `Invoice_id`, `Branch`, `City`, `Customer_type`, `Gender`, `Product_line`, `Unit_price`, `Quantity`, `Tax 5%`, `Total`, `Date`, `Time`, `Payment`, `COGS`, `Gross_income`, `Rating`.

---

## 🛠️ Approach
1. **Data Wrangling**
   - Built database and tables in MySQL  
   - Checked for NULL values (none found due to NOT NULL constraints)  

2. **Feature Engineering**
   - `time_of_day` → Morning / Afternoon / Evening  
   - `day_name` → Day of the week (Mon–Sun)  
   - `month_name` → Month (Jan–Dec)  
   - `product_category` → Good / Bad based on average sales  

3. **Exploratory Data Analysis (EDA)**
   - Answered 28 **business questions** with SQL queries  

---

## 📊 Business Questions & Insights (Q1–Q28)

### Product Analysis
- **Number of product lines** → 6  
- **Most selling product line** → *Fashion accessories*  
- **Highest revenue product line** → *Food & beverages*  
- **Highest VAT product line** → *Health and beauty*  
- **Average rating by product line** → Ranged between 6.7 – 7.1  

### Sales Analysis
- **Highest revenue month** → January  
- **Highest COGS month** → January  
- **City with highest revenue** → Naypyitaw  
- **Branch with above-average sales** → Branch C  
- **Most sales time of day** → Afternoon on weekdays  

### Customer Analysis
- **Unique customer types** → 2 (Member, Normal)  
- **Unique payment methods** → 3 (Cash, Credit card, Ewallet)  
- **Most common customer type** → Member  
- **Gender majority** → Female  
- **Branch-wise gender distribution** → Branch C had more female customers  
- **Most ratings time** → Afternoon  
- **Best day for avg ratings** → Monday  

---

## 🚀 Key Insights
- **Afternoon** consistently has the highest sales volume  
- **Female customers** dominate overall purchase counts  
- **Food & Beverages** and **Fashion Accessories** lead revenue & sales  
- **Members** contribute the most to total revenue  
- **Branch C** outperformed other branches in revenue and customer ratings  

---

## 🛠️ Tools & Skills
- **SQL (MySQL)** → Joins, Aggregations, Window Functions  
- Data Cleaning, Feature Engineering  
- Exploratory Data Analysis (EDA)  
- Business Problem Solving  

---


---
