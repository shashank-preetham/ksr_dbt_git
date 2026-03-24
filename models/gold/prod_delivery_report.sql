SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    UNIT_PRICE,

    DELIVERY_DATE,

    -- Business logic column
    CASE 
        WHEN DELIVERY_STATUS = 'Delivered' THEN 'Yes'
        ELSE 'No'
    END AS IS_DELIVERED

FROM {{ ref('product_delivery_info') }}

-- Sort for reporting
ORDER BY DELIVERY_DATE DESC