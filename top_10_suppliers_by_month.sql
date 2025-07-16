WITH MonthlySupplierSpend AS (
  SELECT 
    DATE_FORMAT(po.order_date, '%Y-%m') AS month,
    po.supplier_id,
    s.supplier_name,
    SUM(po.quantity_ordered * po.unit_cost) AS procurement_cost,
    ROW_NUMBER() OVER (
      PARTITION BY DATE_FORMAT(po.order_date, '%Y-%m') 
      ORDER BY SUM(po.quantity_ordered * po.unit_cost) DESC
    ) AS rn
  FROM procurement_orders po
  JOIN suppliers s ON po.supplier_id = s.supplier_id
  GROUP BY month, po.supplier_id, s.supplier_name
)

SELECT 
  month,
  supplier_id,
  supplier_name,
  ROUND(procurement_cost, 2) AS procurement_cost
FROM MonthlySupplierSpend
WHERE rn <= 10
ORDER BY month, procurement_cost DESC;
