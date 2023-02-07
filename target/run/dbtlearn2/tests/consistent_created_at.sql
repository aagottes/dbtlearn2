select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select 
r.* 
from airbnb.dev.fct_reviews r
left join
airbnb.dev.dim_listings_cleansed l
on r.listing_id=l.listing_id
where r.review_date<l.created_at

limit 10
      
    ) dbt_internal_test