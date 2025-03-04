create database pizza;
use pizza;

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);


CREATE TABLE order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id)
);


-- 1) Find the total number of orders placed.
select count(order_id) from orders;
-- 2) List all unique pizza types available.
select distinct(name) from pizza_types;
-- 3) Get the total number of pizzas sold.
select sum(quantity) as Total_Pizza_sold from order_details; 
-- 4) Join the necessary tables to find the total quantity of each pizza category ordered.
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

-- 5) Identify all orders where more than 5 pizzas were ordered.
SELECT 
    order_id
FROM
    order_details
GROUP BY order_id
HAVING SUM(quantity) > 2;

-- 6) Find the total revenue generated
SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;

-- 7) Get the count of orders placed per day.
SELECT 
    order_date, count(order_id) AS total_orders
FROM
    orders
GROUP BY order_date
ORDER BY total_orders DESC;

-- 8) Identify the most common pizza size ordered
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS No_of_pizzas
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY No_of_pizzas DESC;

-- IMTERMEDIATE Queries

-- 9) Find the highest and lowest revenue-generating pizzas
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

-- 10) List the top 5 most ordered pizza types along with their quantities.
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

-- ADVANCED SQL Quaries

-- 11) Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY COUNT(order_id) DESC;

-- 12) Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    round(avg(quantity),0) as_avg_quantity_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;
    
    
-- 13) Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;

-- 14) Rank pizzas based on total sales quantity
select pizza_types.name, sum(order_details.quantity) as total_sold, rank() over(order by sum(order_details.quantity) desc) as Ranking from order_details join pizzas on order_details.pizza_id = pizzas.pizza_id join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id group by pizza_types.name;


-- 15)  Calculate total revenue per month.
SELECT 
    MONTH(orders.order_date) AS month,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    order_details
        JOIN
    orders ON order_details.order_id = orders.order_id
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY month
ORDER BY revenue DESC;

