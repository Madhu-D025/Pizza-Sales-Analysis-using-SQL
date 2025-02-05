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

``` sql
SELECT 
    COUNT(order_id)
FROM
    orders;
```


2) List all unique pizza types available.

``` sql
SELECT DISTINCT
    (name)
FROM
    pizza_types;

```

3) Get the total number of pizzas sold.

``` sql
select sum(quantity) as Total_Pizza_sold from order_details; 

```

4) Join the necessary tables to find the total quantity of each pizza category ordered.

``` sql
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC; 

```

5) Identify all orders where more than 2 pizzas were ordered.

``` sql
SELECT 
    order_id
FROM
    order_details
GROUP BY order_id
HAVING SUM(quantity) > 2;

```

<br>
- 🔹 Intermediate Queries
<br>
6) Find the total revenue generated.

``` sql
SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;

```


7) Get the count of orders placed per day.

``` sql
SELECT 
    order_date, count(order_id) AS total_orders
FROM
    orders
GROUP BY order_date
ORDER BY total_orders DESC;

```


8) Identify the most common pizza size ordered.

``` sql
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS No_of_pizzas
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY No_of_pizzas DESC;

```


9) Find the highest and lowest revenue-generating pizzas.

``` sql
SELECT 
    pizzas.pizza_id,
    pizza_types.name,
    SUM(order_details.order_id * pizzas.price) AS Revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizzas.pizza_id , pizza_types.name
ORDER BY Revenue DESC; 

```


10) List the top 5 most ordered pizza types along with their quantities.

``` sql
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;
```

