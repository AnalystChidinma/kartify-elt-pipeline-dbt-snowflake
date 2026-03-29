SELECT
    Id as order_item_id,
    Order_id,
    Product_id,
    Quantity,
    Unit_Price,
    Quantity * Unit_Price as Total_price,
    Created_at,
    Updated_at
FROM
    {{source('RAW', 'RAW_ORDER_ITEMS')}}