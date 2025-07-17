SELECT 
	po.product_id product_id,
     p.product_name product_name,
	SUM(po.quantity_ordered) total_units_ordered
FROM procurement_orders po
JOIN products p ON po.product_id=p.product_id
GROUP BY product_id
ORDER BY SUM(quantity_ordered) DESC;





