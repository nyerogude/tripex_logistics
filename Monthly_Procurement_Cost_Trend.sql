SELECT DATE_FORMAT(order_date,'%Y-%m') month,
ROUND(SUM(quantity_ordered * unit_cost),2) procurement_cost,
COUNT(order_id) total_orders
FROM procurement_orders
GROUP BY month
ORDER BY month;