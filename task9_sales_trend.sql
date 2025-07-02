
-- Task 9: Sales Trend Analysis Using Aggregations

-- 1. Monthly Revenue & Order Volume
SELECT 
    strftime('%Y-%m', order_date) AS month,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY month
ORDER BY month;

-- For MySQL: replace strftime with DATE_FORMAT(order_date, '%Y-%m')
-- For PostgreSQL: replace strftime with TO_CHAR(order_date, 'YYYY-MM')

-- 2. Peak Sales Month
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 1;

-- 3. Weekday Buying Behavior
SELECT 
    strftime('%w', order_date) AS weekday_number,
    CASE strftime('%w', order_date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS weekday,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY weekday_number
ORDER BY weekday_number;
