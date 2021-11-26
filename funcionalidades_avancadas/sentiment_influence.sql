-- ANALYSIS 1:
-- average of sentiment for each company:
SELECT 
    symbol,
    AVG(sentiment)
FROM
    tweets_with_stock_price
GROUP BY 
    symbol;

-- AAPL	0.13203072961449203
-- AMZN	0.1575645925018116
-- GOOG	0.09116439555848761
-- GOOGL 0.17677634788406024
-- MSFT	0.12003527365448162
-- TSLA	0.09504394649125154
-- not much difference, except tesla significantly lower than the others


-- ANALYSIS 2:
-- this CTE filters multiple tweets from bot accounts
WITH no_repeated AS (
	SELECT DISTINCT ON (body,dt) 
		*	
	FROM tweets_with_stock_price tweet
) 
SELECT
  dt as "time",
  AVG(sentiment)*100 as "sentiment"
FROM
  no_repeated
WHERE
--   symbol = 'AAPL' and dt is not null
--   symbol = 'AMZN' and dt is not null
  symbol = 'MSFT' and dt is not null
--   symbol = 'TSLA' and dt is not null
GROUP BY dt;

SELECT
  dt as "time",
  high_price as "msft_stock_price"
FROM
  msft
WHERE dt >= '2015-01-01'
  AND dt < '2020-01-01';

-- msft: average sentiment remained almost constant, slight increase
-- after 2017
-- aapl: almost mirror image of the stock price. Interesting to notice
-- that sentiment changes only with large fluctuations. The actual
-- price of the stock does not matter
-- amzn: had to be multiplied by 3k. large dip and subsequent rise
-- in average sentiment during 2017. What happened?
-- tsla: in rough terms, it seems like stock fluctiations have little
-- to no effect on average sentiment
