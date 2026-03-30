with orders AS (
    SELECT * 
    FROM {{ ref('stg_orders') }}
),
order_items As(
    SELECT *
    FROM {{ ref('stg_order_items') }}
),
customers AS (
    SELECT *
    FROM {{ ref('stg_customers') }}
)

SELECT
    o.order_id,
    o.Customer_id,
    o.order_status,
    o.order_status_desc,
    o.created_at as order_created_at,
    o.updated_at as order_updated_at,
    c.Customer_Name,
    count(Distinct o.Order_id) as total_order_count,
    sum(oi.Total_price) as Revenue
FROM 
    orders o
LEFT JOIN 
    customers c ON o.Customer_id = c.Customer_id
LEFT JOIN 
    order_items oi ON o.Order_id = oi.Order_id
GROUP BY
    o.order_id,
    o.Customer_id,
    c.Customer_Name,
    o.order_status,
    o.order_status_desc,
    o.created_at,
    o.updated_at

