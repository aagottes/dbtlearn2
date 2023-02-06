
WITH  __dbt__cte__src_reviews as (
with src_reviews as (
select LISTING_ID, DATE as review_date, REVIEWER_NAME, COMMENTS as review_text,
SENTIMENT as review_sentiment from airbnb.raw.raw_reviews)
select * from src_reviews
),src_reviews AS (
 SELECT * FROM __dbt__cte__src_reviews
)
SELECT * FROM src_reviews
WHERE review_text is not null

 AND review_date > (select max(review_date) from airbnb.dev.fct_reviews)
 
 