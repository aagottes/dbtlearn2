with src_reviews as (
select LISTING_ID, DATE as review_date, REVIEWER_NAME, COMMENTS as review_text,
SENTIMENT as review_sentiment from airbnb.raw.raw_reviews)
select * from src_reviews