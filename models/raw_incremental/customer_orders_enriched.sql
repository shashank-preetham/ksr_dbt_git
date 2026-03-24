SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    o.amount,
    o.payment_mode,
    c.full_name,
    c.city,
    c.state
FROM {{ source('raw_data', 'customer_orders') }} o
INNER JOIN {{ source('raw_data', 'customer_master') }} c
    ON o.customer_id = c.customer_id

-- Source Filtering
WHERE c.status = 'active'
AND o.order_date >= DATEADD(day, -30, CURRENT_DATE)

{% if is_incremental() %}
    -- Only process new/changed data
    AND o.order_date >= (
        SELECT COALESCE(MAX(order_date), '1900-01-01')
        FROM {{ this }}
    )
{% endif %}