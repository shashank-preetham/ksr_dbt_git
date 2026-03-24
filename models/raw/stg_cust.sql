SELECT
    *,
    CURRENT_TIMESTAMP AS loaded_at   -- auditing column
FROM {{ source('data_feed_raw', 'CUSTOMER') }}