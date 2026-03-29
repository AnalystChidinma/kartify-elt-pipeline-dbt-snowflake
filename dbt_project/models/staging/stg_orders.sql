SELECT 
    Id as Order_id,
    Customer_id,
    Status AS Order_status,
    CASE
        when Status = '1' then 'Pending'
        when Status = '2' then 'Shipped'
        when Status = '3' then 'Cancelled'
        when Status = '4' then 'Processing'
        when Status = '5' then 'Delivered'
        ELSE NULL
    end as Order_status_desc,
    Created_at,
    Updated_at
FROM 
    {{ source('RAW', 'RAW_ORDERS') }}