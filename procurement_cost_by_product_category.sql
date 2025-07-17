WITH procurement_cost_by_category AS (
    SELECT 
        p.category,
        SUM(po.quantity_ordered * po.unit_cost) AS procurement_cost
    FROM products p 
    JOIN procurement_orders po 
        ON p.product_id = po.product_id
    GROUP BY p.category
)

SELECT 
    category,
    procurement_cost,
    ROUND((procurement_cost / SUM(procurement_cost) OVER()) * 100, 2) AS pct_of_total_spend
FROM procurement_cost_by_category
ORDER BY procurement_cost DESC;
