SHOW tables;
DESC orders;
SELECT order_date FROM orders;
SELECT order_date, category, sub_category, sales_amount, profit FROM orders ORDER BY order_date;

SELECT EXTRACT(YEAR from order_date) as "order_year" ,
monthname(order_date) "order_Month",
EXTRACT(DAY from order_date) as "order_day",
product, category, sub_category, 
COUNT(DISTINCT order_Id) as "sales_volume",
sum(sales_amount) "Sales", sum(profit) "Profit",
avg(sales_amount) "Average Sales",
avg(profit) "Average Profit",
ROUND(stddev(sales_amount), 2) as "standard_deviation_of_sales",
ROUND(stddev(profit), 2) as "standard_deviation_of_profit",
ROUND((SUM(profit)/SUM(sales_amount))*100, 2) as "profit_margin_%"
FROM orders group by order_date, 
category, sub_category, 
product order by extract(YEAR FROM order_date)
desc, 
EXTRACT(MONTH FROM order_date) asc, 
EXTRACT(DAY FROM order_date) asc;

CREATE TABLE monthly_sales_summary AS
SELECT EXTRACT(YEAR from order_date) as "order_year" ,
monthname(order_date) "order_Month",
EXTRACT(DAY from order_date) as "order_day",
product, category, sub_category, 
COUNT(DISTINCT order_Id) as "sales_volume",
sum(sales_amount) "Sales", sum(profit) "Profit",
avg(sales_amount) "Average Sales",
avg(profit) "Average Profit",
ROUND(stddev(sales_amount), 2) as "standard_deviation_of_sales",
ROUND(stddev(profit), 2) as "standard_deviation_of_profit",
ROUND((SUM(profit)/SUM(sales_amount))*100, 2) as "profit_margin_%"
FROM orders group by order_date, 
category, sub_category, 
product order by extract(YEAR FROM order_date)
desc, 
EXTRACT(MONTH FROM order_date) asc, 
EXTRACT(DAY FROM order_date) asc;
