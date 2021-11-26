-- tweets
SELECT
  dt as "time",
  count(tweet_id)/100 as "number_of_tweets"
FROM
  tweets_with_stock_price
WHERE
  symbol = 'AAPL' and dt is not null
GROUP BY dt;
--- stock price
SELECT
  dt as "time",
  high_price as "aapl_stock_price"
FROM
  aapl
WHERE dt >= '2015-01-01'
  AND dt < '2020-01-01';

-- count(tweet_id)/100 is divided by 100
-- to adjust the order of magnitude 
-- so that it fits in the y-axis
-- AAPL: divide by 100
-- MSFT: divide by 10
-- AMZN: divide by 1

-- Unfortunate that we do not have tweets past 2019 
-- because that is when TSLA stocks skyrocketed




