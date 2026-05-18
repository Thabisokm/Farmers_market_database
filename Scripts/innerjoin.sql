SELECT 
    b.buyer_id,
    b.full_name,
    b.email,
    o.order_id,
    o.order_date
FROM buyers b
INNER JOIN orders o
    ON b.buyer_id = o.buyer_id
WHERE o.order_id IS NOT NULL;