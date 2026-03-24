SELECT
    *,
    CURRENT_TIMESTAMP AS loaded_at
FROM {{ source('data_feed_raw', 'PRODUCT') }}