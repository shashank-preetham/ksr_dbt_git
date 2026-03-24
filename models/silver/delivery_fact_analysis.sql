{{ config(materialized='table') }}

SELECT
    c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    c.EMAIL,
    c.CITY,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.PRODUCT_CATEGORY,
    p.PRICE,
    d.DELIVERY_ID,
    d.DELIVERY_STATUS_DESC,
    d.DELIVERY_DATE,
    d.COURIER_SERVICE,
    d.QUANTITY,
    d.TOTAL_AMOUNT
FROM {{ ref('cust') }} c

JOIN {{ ref('delivery') }} d
    ON c.CUSTOMER_ID = d.CUSTOMER_ID

JOIN {{ ref('prod') }} p
    ON d.PRODUCT_ID = p.PRODUCT_ID