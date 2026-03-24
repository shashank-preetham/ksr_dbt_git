
SELECT
    customer_id,
    full_name,
    email,
    city,
    state,
    registered_on,
    status
FROM {{ source('raw_data', 'customer_master') }}