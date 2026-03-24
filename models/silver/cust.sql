{{ config(materialized='view') }}

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    CITY
FROM {{ source('data_feed_raw', 'CUSTOMER') }}
