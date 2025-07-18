SELECT 
	s.supplier_id, 
	s.supplier_name,
	SUM(po.quantity_ordered * po.unit_cost) procurement_cost
FROM suppliers s 
JOIN procurement_orders po ON s.supplier_id = po.supplier_id
GROUP BY supplier_id, supplier_name
ORDER BY procurement_cost DESC;


