


-- Feature Engineering 
-- 1. Adding Time_of_day column in a seperate column.

SELECT * FROM walmart_sales_data;

SELECT 
Time,
(CASE
	WHEN Time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
    WHEN Time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
    ELSE "Evening"
END) as Time_of_day
FROM walmart_sales_data;

ALTER TABLE walmart_sales_data ADD COLUMN Time_of_day VARCHAR(20);

UPDATE walmart_sales_data
SET Time_of_day = (CASE
	WHEN Time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
    WHEN Time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
    ELSE "Evening"
END) ;


-- 2. Day_name

SELECT Date, 
DAYNAME(Date) FROM 
walmart_sales_data;

ALTER TABLE walmart_sales_data
ADD COLUMN Day_name varchar(10);


UPDATE walmart_sales_data 
SET Day_name = DAYNAME(Date);


-- 3. month_name

SELECT Date, 
MONTHNAME(Date) FROM 
walmart_sales_data;

ALTER TABLE walmart_sales_data
ADD COLUMN Month_name varchar(10);


UPDATE walmart_sales_data 
SET Month_name = MONTHNAME(Date);




-- EDA / Exploratory Data Analysis


-- Q1. How many distinct cities are present in the dataset?
SELECT 
DISTINCT City 
FROM walmart_sales_data;


-- Q2. In which city is each branch situated?
SELECT 
DISTINCT branch, city 
FROM walmart_sales_data;


-- Q3. How many distinct product lines are there in the dataset?
SELECT 
COUNT(DISTINCT `Product line`)
FROM walmart_sales_data;


-- Q4. What is the most common payment method?
SELECT Payment,COUNT(Payment) as most_common_payment_method
FROM walmart_sales_data
GROUP BY Payment ORDER BY most_common_payment_method DESC LIMIT 1;


-- Q5. What is the most selling product line?
SELECT `Product line`, COUNT(`Product line`) as  Product_Line_Count
FROM walmart_sales_data
GROUP BY `Product line` ORDER BY Product_Line_Count DESC LIMIT 1;

-- Q6. What is the total revenue by month?
SELECT Month_name, ROUND(SUM(Total)) as Total_revenue FROM
walmart_sales_data
GROUP BY Month_name 
ORDER BY Total_revenue DESC;


-- Q7. Which month recorded the highest Cost of Goods Sold (COGS)?

SELECT Month_name, ROUND(SUM(cogs),2) as highest_cogs
FROM walmart_sales_data
GROUP BY Month_name
ORDER BY highest_cogs DESC LIMIT 1;

-- Q8. Which product line generated the highest revenue?

SELECT `Product line`, SUM(Total) as Total_revenue
FROM walmart_sales_data
GROUP BY `Product line` ORDER BY Total_revenue DESC LIMIT 1;

-- Q9. Which city has the highest revenue?

SELECT City, SUM(Total) as Total_revenue
FROM walmart_sales_data
GROUP BY City ORDER BY Total_revenue DESC LIMIT 1;

-- Q10. Which product line incurred the highest VAT?

SELECT `Product line`, ROUND(SUM(`Tax 5%`),2) as Total_tax_amount
FROM walmart_sales_data
GROUP BY `Product line` ORDER BY Total_tax_amount DESC LIMIT 1;

-- Q11. Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.

ALTER TABLE walmart_sales_data
ADD COLUMN product_category VARCHAR(20);

SET @avg_total := (SELECT AVG(total) FROM walmart_sales_data);

UPDATE walmart_sales_data
SET product_category = CASE
  WHEN total >= @avg_total THEN 'GOOD'
  ELSE 'BAD'
END;


-- Q12. Which branch sold more products than average product sold?


SELECT Branch, sum(quantity) as total_quantity_sold
FROM walmart_sales_data
GROUP BY Branch HAVING sum(quantity) > avg(quantity)
order by total_quantity_sold DESC
;


-- Q13. What is the most common product line by gender?

SELECT Gender, `Product line`, COUNT(Gender) as total_count
FROM walmart_sales_data
GROUP BY Gender, `Product line` 
ORDER BY total_count DESC;

-- Q14. What is the average rating of each product line?

SELECT `product line`,ROUND(AVG(Rating),2) as avg_rating
FROM walmart_sales_data
GROUP BY `Product line` ORDER BY avg_rating DESC ;



-- Q15. Number of sales made in each time of the day per weekday?

SELECT day_name, time_of_day, COUNT(`invoice id`) AS total_sales
FROM walmart_sales_data GROUP BY day_name, time_of_day HAVING day_name NOT IN ('Sunday','Saturday') ORDER BY total_sales DESC;

-- Q16. Identify the customer type that generates the highest revenue?

SELECT `Customer type`, ROUND(SUM(Total)) as total_sum
FROM walmart_sales_data
GROUP BY `Customer type` ORDER BY total_sum DESC LIMIT 1 ;

-- Q17. Which city has the largest tax percent/ VAT (Value Added Tax)? 

SELECT City, ROUND(SUM(`Tax 5%`),2) as total_tax
FROM walmart_sales_data 
GROUP BY City ORDER BY total_tax DESC LIMIT 1;

-- Q18. Which customer type pays the most VAT?

SELECT `Customer type`, ROUND(SUM(`tax 5%`)) as total_tax_pay
FROM walmart_sales_data
GROUP BY `Customer type` ORDER BY total_tax_pay DESC LIMIT 1 ;


-- Customer Analysis

-- Q19. How many unique customer types does the data have?

SELECT COUNT(distinct `Customer type`) 
FROM walmart_sales_data;

-- Q20. How many unique payment methods does the data have?

SELECT COUNT(DISTINCT payment) 
FROM walmart_sales_data;

-- Q21. Which is the most common customer type?

SELECT `Customer type`,count(`customer type`) as total_customer
FROM walmart_sales_data 
GROUP BY `Customer type` ORDER BY total_customer DESC LIMIT 1; 

-- Q22. Which customer type buys the most?

SELECT `Customer type`, SUM(total) as total_buys 
FROM walmart_sales_data
GROUP BY `Customer type` ORDER BY total_buys DESC LIMIT 1;

-- Q23. What is the gender of most of the customers?

SELECT Gender,COUNT(*) as total_count
FROM walmart_sales_data
GROUP BY Gender ORDER BY total_count DESC LIMIT 1;

-- Q24. What is the gender distribution per branch?

SELECT Branch, Gender, COUNT(Gender) as gender_distribution
FROM walmart_sales_data GROUP BY Branch,Gender ORDER BY Branch;

-- Q25. Which time of the day do customers give most ratings?

SELECT Time_of_day, ROUND(AVG(rating),2) as avg_ratings
FROM walmart_sales_data
GROUP BY Time_of_day ORDER BY avg_ratings DESC LIMIT 1;

-- Q26. Which time of the day do customers give most ratings per branch?
SELECT branch, time_of_day, AVG(rating) AS average_rating
FROM walmart_sales_data GROUP BY branch, time_of_day ORDER BY average_rating DESC;


-- Q27. Which day of the week has the best avg ratings?
SELECT day_name, AVG(rating) AS average_rating
FROM walmart_sales_data GROUP BY day_name ORDER BY average_rating DESC LIMIT 1;

-- Q28. Which day of the week has the best average ratings per branch?
SELECT  branch, day_name, AVG(rating) AS average_rating
FROM walmart_sales_data GROUP BY day_name, branch ORDER BY average_rating DESC;


