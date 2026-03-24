{{ config(materialized='view') }}

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    UPPER(CATEGORY) AS PRODUCT_CATEGORY,   -- standardization
    PRICE
FROM {{ source('data_feed_raw', 'PRODUCT') }}