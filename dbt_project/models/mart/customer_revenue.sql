WITH fct_orders AS (
    SELECT *
    FROM {{ ref('fct_orders') }}

),
customers AS (
    SELECT *
    FROM {{ ref('stg_customers') }}
)

SELECT
    f.Customer_id,
    c.customer_name,
    sum(f.revenue) as total_revenue,
    sum(f.total_order_count) as total_orders
FROM 
    fct_orders f
LEFT JOIN 
    stg_customers c ON f.Customer_id = c.Customer_id
GROUP BY
    f.Customer_id,
    c.customer_name
ORDER BY    
    total_revenue DESC
