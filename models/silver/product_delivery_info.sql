SELECT
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    -- Standardize category
    UPPER(p.CATEGORY) AS CATEGORY,
    -- Rename price
    p.PRICE AS UNIT_PRICE,
    d.DELIVERY_ID,
    -- Convert date format but keep DATE type
    TO_DATE(
        TO_CHAR(d.DELIVERY_DATE, 'DD-MM-YYYY'),
        'DD-MM-YYYY'
    ) AS DELIVERY_DATE,
    d.DELIVERY_STATUS,
    d.QUANTITY,
    d.TOTAL_AMOUNT

FROM {{ source('data_feed_raw', 'PRODUCT') }} p

JOIN {{ source('data_feed_raw', 'DELIVERY_STATUS_FACT') }} d
    ON p.PRODUCT_ID = d.PRODUCT_ID