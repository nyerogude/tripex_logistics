SELECT 
	po.product_id, 
    p.product_name,
    SUM(po.quantity_ordered) quantity_ordered
FROM procurement_orders po
JOIN products p ON po.product_id = p.product_id
GROUP BY product_id,product_name 
ORDER BY quantity_ordered ASC
LIMIT 10;