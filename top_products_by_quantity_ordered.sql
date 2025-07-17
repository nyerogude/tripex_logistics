SELECT 
	product_id,
	SUM(quantity_ordered) total_units_ordered
FROM procurement_orders
GROUP BY product_id
ORDER BY SUM(quantity_ordered) DESC;





