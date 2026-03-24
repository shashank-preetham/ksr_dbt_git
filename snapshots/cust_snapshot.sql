{% snapshot snapshot_timestamp %}

{{
    config(
        unique_key='id',
        strategy='timestamp',
        updated_at='update_at',
        invalidate_hard_deletes=True

    )
}}

SELECT *
FROM {{ source('raw_data', 'cust_tbl') }}

{% endsnapshot %}