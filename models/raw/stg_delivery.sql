SELECT
    *,
    CURRENT_TIMESTAMP AS loaded_at
FROM {{ source('data_feed_raw', 'DELIVERY_STATUS_FACT') }}