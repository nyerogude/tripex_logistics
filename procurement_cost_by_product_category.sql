SELECT 
	p.category category,
    SUM(po.quantity_ordered*po.unit_cost) procurement_cost
FROM products p 
JOIN procurement_orders po ON p.product_id=po.product_id
GROUP BY p.category
ORDER BY procurement_cost DESC;



