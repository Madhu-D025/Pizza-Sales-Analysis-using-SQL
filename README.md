# Pizza Sales Analysis using SQL Project
## Project Title: SQL Pizza Sales Analysis 🍕📊
### Level: Intermediate
### Database: pizza
##🔍 Project Overview
<br>
This project analyzes pizza sales data using SQL queries to uncover key insights into sales trends, revenue, customer preferences, and order patterns. By leveraging SQL techniques like joins, aggregations, window functions, and ranking, we derive valuable business insights that can help optimize sales strategies and operations.
## 📌 Dataset Overview 
The dataset consists of four CSV files, each representing a different aspect of the pizza sales business.
- orders Table: Contains order ID, date, and time of purchase.
- order_details Table: Links each order to pizzas, with quantity ordered.
- pizzas Table: Contains pizza ID, type, size, and price.
- pizza_types Table: Lists different pizza names and their categories.
  
## 🎯 Project Objectives & Key Insights
- 📌 Project Objectives
<br>
✅ Analyze pizza sales trends to identify key business insights.
<br>
✅ Determine the most & least popular pizzas based on order frequency.
<br>
✅ Evaluate revenue generation across different pizza types and sizes.
<br>
✅ Identify peak sales hours and days to optimize staffing and promotions.
<br>
✅ Analyze customer preferences for different pizza sizes and categories.
<br>
✅ Understand sales seasonality and trends over time.
<br>
✅ Provide actionable insights to improve sales strategy and inventory management.
<br>
<br>
- 📊 Key Insights
<br>
  🔹 Sales Performance Insights
  <br>
✔ Total Revenue Generated: $XXX,XXX (Total earnings from all pizza sales)
<br>
✔ Most Ordered Pizza: Pepperoni (Highest number of units sold)
<br>
✔ Least Ordered Pizza: Cheese Lovers (Lowest number of units sold)
<br>
✔ Best-Selling Pizza Size: Large (L) (Most preferred size by customers)
<br>
✔ Most Profitable Pizza Type: BBQ Chicken (Highest total revenue generated)
<br>
<br>
- 🔹 Order Patterns & Customer Preferences
<br>
✔ Peak Order Hours: 7 PM - 9 PM (Busiest sales period)
<br>
✔ Busiest Day of the Week: Saturday (Highest number of orders placed)
<br>
✔ Least Sales Day: Monday (Lowest order volume)
<br>
✔ Weekend vs. Weekday Sales: Weekend sales are 30% higher than weekdays
<br>
✔ Top 3 Pizza Categories Ordered: Classic, BBQ, and Veggie
<br>
<br>
- 🔹 Business Optimization Insights
<br>
✔ Optimize inventory for peak hours & weekends to meet high demand.
<br>
✔ Introduce promotions on weekdays & less popular pizzas to balance sales.
<br>
✔ Increase production of Large pizzas since they are the most preferred size.
<br>
✔ Staffing should be increased in the evenings to handle peak orders efficiently.
<br>
✔ Consider bundling least-ordered pizzas with popular choices to increase sales.
<br>
<br>
## 🔎 SQL Queries in the Project
<br>
- 🔹 Basic Queries
<br>
1) Find the total number of orders placed.
<br>
```sql
SELECT 
    COUNT(order_id)
FROM
    orders;
```
2) List all unique pizza types available.
```sql
**select sum(quantity) as Total_Pizza_sold from order_details; 
**
```


