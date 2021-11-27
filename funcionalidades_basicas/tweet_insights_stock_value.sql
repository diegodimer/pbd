select
    symbol,
    TO_CHAR(
        date_trunc('month', to_timestamp(twsp.post_date)),
        'MM/YYYY'
    ) as time_period,
    avg(twsp.low_price) as avg_low_price,
    avg(like_num) as average_likes,
    avg(retweet_num) as average_rts,
    count(*) as n_tweets
from
    tweets_with_stock_price twsp
where
    twsp.close_price is not null
group by
    date_trunc('month', to_timestamp(twsp.post_date)),
    symbol

-- by seeing the average likes and retweets in tweets about the companhies, we may not be able
-- to assume anything, mostly because a tweet with a lot of interaction would be affected by
-- others with no interaction and the mean would be low. If we look at the number of tweets
-- we see that the most commented companhies are very often apple and tesla, and even though they
-- are not the top 2 companhies, they are the ones with most engagement online and significant growth