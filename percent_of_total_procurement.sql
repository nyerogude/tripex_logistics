SELECT 
    s.supplier_name,
    ROUND(SUM(po.quantity_ordered * po.unit_cost), 2) AS procurement_cost,
    ROUND(
        SUM(po.quantity_ordered * po.unit_cost) * 100.0 
        / SUM(SUM(po.quantity_ordered * po.unit_cost)) OVER(), 
    2) AS pct_of_total_procurement
FROM suppliers s
JOIN procurement_orders po ON s.supplier_id = po.supplier_id
GROUP BY s.supplier_name
ORDER BY procurement_cost DESC
LIMIT 10;
