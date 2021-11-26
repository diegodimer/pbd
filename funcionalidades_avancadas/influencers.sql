-- find out influencers
SELECT 
	writer, 
	SUM(like_num) AS total_likes,
	SUM(comment_num) AS total_comments,
	SUM(retweet_num) AS total_retweets
FROM
  tweets_with_stock_price 
WHERE symbol IS NOT NULL
GROUP BY writer
ORDER BY total_likes DESC;

-- see which companies an influencer tweets about
SELECT 
    symbol,
	count(tweet_id)
FROM 
    tweets_with_stock_price twsp 
WHERE writer = 'vincent13031925'
GROUP BY symbol;

-- see if there is a correlation between tweets and price on grafana
-- tweets
SELECT 
    dt as "time",
	count(tweet_id)
FROM 
    tweets_with_stock_price twsp 
WHERE writer = 'vincent13031925'
  AND symbol = 'TSLA'
  AND dt is not null
GROUP BY dt;

-- price
SELECT
  dt as "time",
  high_price as "tsla_price"
FROM
  tsla
WHERE dt >= '2015-01-01'
  AND dt < '2020-01-01';

-- did not find any meaningful correlation between an individual 
-- and stock price.
-- Probably the only account that has this influence is @elonmusk
-- between 2020 - 2021, or other CEOs active on twitter.
-- maybe it requires a deeper analysis