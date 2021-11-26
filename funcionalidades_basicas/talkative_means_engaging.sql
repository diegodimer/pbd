-- the most engaging users are the ones that write the most about a company?
with AAPL_TABLE as (
    select
        tweet_id,
        comment_num,
        like_num,
        retweet_num,
        writer
    from
        tweet
        join company_tweet using(tweet_id)
    where
        symbol = 'TSLA'
),
TALKATIVE_USERS as (
    select
        writer,
        count(tweet_id) as tweet_count
    from
        AAPL_TABLE
    group by
        writer
    order by
        tweet_count desc
    limit
        10
), ENGAGING_USERS as (
    select
        writer,
        sum(comment_num + retweet_num + like_num) as engajamento
    from
        AAPL_TABLE
    group by
        writer
    order by
        engajamento desc
    limit
        10
)
select
    *
from
    ENGAGING_USERS
where
    writer in (
        select
            writer
        from
            TALKATIVE_USERS
    )
-- not true. For most of the companies there is no relation between users that tweets most and users with more tweet interactions.
-- for MSFT and TSLA there is two, for the others 0.