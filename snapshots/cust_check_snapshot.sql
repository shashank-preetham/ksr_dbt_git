{% snapshot cust_check_snapshot %}
    {{
        config(
            unique_key='id',
            strategy='check',
            check_cols=['email', 'spend'],
            invalidate_hard_deletes=True
        )
    }}

    select * from {{ source('raw_data', 'cust_tbl') }}
 {% endsnapshot %}