SELECT * FROM customers 
LIMIT 10;

SELECT customer_id, customer_city, customer_state
FROM customers
WHERE customer_state = 'SP'
LIMIT 10;

SELECT customer_id, customer_city, customer_state
FROM customers
WHERE customer_state = 'SP'
ORDER BY customer_city ASC
LIMIT 10;

SELECT customer_state, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

SELECT 
    strftime('%Y-%m', order_purchase_timestamp) AS order_month,
    COUNT(order_id) AS total_orders
FROM orders
WHERE order_status = 'delivered'   -- optional filter to count only delivered orders
GROUP BY order_month
ORDER BY order_month;
SELECT 
    o.order_id, 
    o.order_status, 
    c.customer_city, 
    c.customer_state
FROM orders AS o
INNER JOIN customers AS c 
    ON o.customer_id = c.customer_id
LIMIT 10;

SELECT 
    c.customer_id, 
    o.order_id
FROM customers AS c
LEFT JOIN orders AS o 
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) > 5;

SELECT * FROM customers WHERE customer_id IN ( SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) > 5 );

SELECT order_id, SUM(payment_value) AS total_payment
FROM order_payments
GROUP BY order_id
ORDER BY total_payment DESC
LIMIT 10;

SELECT AVG(review_score) AS average_rating
FROM order_reviews;

CREATE VIEW vw_customer_spending AS
SELECT 
    c.customer_id,
    c.customer_city,
    SUM(op.payment_value) AS total_spent
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_payments AS op ON o.order_id = op.order_id
GROUP BY c.customer_id, c.customer_city;
SELECT * 
FROM vw_customer_spending
ORDER BY total_spent DESC
LIMIT 10;

CREATE INDEX idx_orders_purchase_date
ON orders(order_purchase_timestamp);
EXPLAIN QUERY PLAN
SELECT * FROM orders
WHERE order_purchase_timestamp >= '2018-01-01';
