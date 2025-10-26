# Task 4: SQL for Data Analysis

**Dataset:** Olist E-commerce Database (SQLite)  

**Objective:**  
Use SQL queries to extract and analyze data from the Olist E-commerce database.  
The task includes using `SELECT` statements, filtering, ordering, grouping, joins, subqueries, aggregate functions, creating views, and optimizing queries with indexes.

---

## Steps Performed

### 1. SELECT, WHERE, ORDER BY, GROUP BY
- Retrieved data from the `customers` table.
- Filtered customers by state and ordered by city.
- Counted total customers by state.
- Counted orders per month using `GROUP BY` and `strftime`.

### 2. JOINS (INNER JOIN, LEFT JOIN)
- Used `INNER JOIN` to combine orders and customer information.
- Used `LEFT JOIN` to find customers who did not have any orders.

### 3. Subqueries
- Identified customers with more than 2 orders.
- Retrieved detailed information of these customers using a subquery.

### 4. Aggregate Functions (SUM, AVG)
- Calculated total payment per order from `order_payments` table.
- Calculated average review score from `order_reviews` table.

### 5. Views for Analysis
- Created a view `vw_customer_spending` showing total spending of each customer.
- Retrieved top 10 customers by total spending from the view.

### 6. Query Optimization with Indexes
- Created an index on `orders.order_purchase_timestamp` to speed up date-based queries.
- Verified index usage using `EXPLAIN QUERY PLAN`.

---

## Outcome
- Learned to manipulate and query structured data using SQL.
- Practiced filtering, grouping, joining tables, using subqueries, aggregations, views, and indexes.
- Generated visual outputs (screenshots) of SQL queries for analysis.
