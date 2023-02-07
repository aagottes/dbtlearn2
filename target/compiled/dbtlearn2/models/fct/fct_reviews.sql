
WITH  __dbt__cte__src_reviews as (
with src_reviews as (
select LISTING_ID, DATE as review_date, REVIEWER_NAME, COMMENTS as review_text,
SENTIMENT as review_sentiment from airbnb.raw.raw_reviews)
select * from src_reviews
),src_reviews AS (
 SELECT * FROM __dbt__cte__src_reviews
)
SELECT 

    
md5(cast(coalesce(cast(listing_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_date as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(reviewer_name as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_text as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as review_id,
*

 FROM src_reviews
WHERE review_text is not null

 AND review_date > (select max(review_date) from airbnb.dev.fct_reviews)
 
 