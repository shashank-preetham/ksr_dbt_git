
SELECT
    customer_id,
    full_name,
    email,
    city,
    state,
    registered_on,
    status
FROM {{ source('raw_data', 'customer_master') }}
{% if is_incremental() %}
WHERE registered_on >= DATEADD(day, -30, CURRENT_DATE)
{% endif %}