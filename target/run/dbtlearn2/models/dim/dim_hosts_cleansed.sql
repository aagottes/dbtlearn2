
  create or replace  view airbnb.dev.dim_hosts_cleansed
  
   as (
    

With  __dbt__cte__src_hosts as (
with raw_hosts as (
select *
    from airbnb.raw.raw_hosts

)

select ID as host_id, NAME as host_name, IS_SUPERHOST, CREATED_AT, UPDATED_AT

from raw_hosts
),src_hosts as (
    select * from __dbt__cte__src_hosts)

    select host_id, NVL(host_name, 'Anonymous') as host_name,
    IS_SUPERHOST, CREATED_AT, UPDATED_AT
    
    from src_hosts
  );
