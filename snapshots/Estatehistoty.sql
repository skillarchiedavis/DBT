{% snapshot snapshot_name %}

{{
   config(
       target_schema='snapshots',
       unique_key= 'ITEMS',
       strategy='check',
       check_cols= 'all'
   )
}}

select * from {{source('estateETL','balance_staging')}}
{% endsnapshot %}