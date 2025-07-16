SELECT 
    po.supplier_id,
    s.supplier_name,
    ROUND(SUM(po.quantity_ordered * po.unit_cost), 2) AS procurement_cost
FROM procurement_orders po
JOIN suppliers s ON po.supplier_id = s.supplier_id
GROUP BY po.supplier_id, s.supplier_name
ORDER BY procurement_cost DESC
LIMIT 10;
