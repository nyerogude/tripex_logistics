SELECT 
    p.product_name,
    COUNT(po.order_id) AS order_frequency
FROM products p
JOIN procurement_orders po ON p.product_id = po.product_id
GROUP BY p.product_name
ORDER BY order_frequency DESC
LIMIT 10;

