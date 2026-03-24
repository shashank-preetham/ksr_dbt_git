{{ config(materialized='view') }}

SELECT
    DELIVERY_ID,
    CUSTOMER_ID,
    PRODUCT_ID,

    -- Translate delivery status
    CASE 
        WHEN DELIVERY_STATUS = 'Delivered' THEN 'SUCCESS'
        WHEN DELIVERY_STATUS = 'Shipped' THEN 'IN TRANSIT'
        WHEN DELIVERY_STATUS = 'Pending' THEN 'AWAITING DISPATCH'
        WHEN DELIVERY_STATUS = 'Cancelled' THEN 'FAILED'
        ELSE 'UNKNOWN'
    END AS DELIVERY_STATUS_DESC,

    DELIVERY_DATE,

    -- Courier logic
    CASE 
        WHEN DELIVERY_STATUS = 'Delivered' THEN 'BlueDart'
        WHEN DELIVERY_STATUS = 'Shipped' THEN 'DTDC'
        ELSE 'Not Assigned'
    END AS COURIER_SERVICE,

    QUANTITY,
    TOTAL_AMOUNT

FROM {{ source('data_feed_raw', 'DELIVERY_STATUS_FACT') }}