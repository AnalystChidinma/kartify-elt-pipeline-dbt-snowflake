SELECT 
    Id as customer_id,
    First_name,
    Last_name,
    Email,
    Phone,
    Address,
    City,
    State,
    Country,
    Postal_code,
    Created_at,
    Updated_at,
    CONCAT(First_name, ' ', Last_name) as Customer_Name
FROM 
    {{source('RAW', 'RAW_CUSTOMERS')}}
