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
  symbol = 'TSLA' and dt is not null
GROUP BY dt;

SELECT
  dt as "time",
  high_price as "tsl_stock_price"
FROM
  tsla
WHERE dt >= '2015-01-01'
  AND dt < '2020-01-01';
-- there is an all time low sentiment score on 2016-06-30. What happened?
-- Government agency opens investigation after a tesla driver was killed using the autopilot mode!
-- $TSLA bad news...http://finance.yahoo.com/news/u-opens-investigation-fatal-crash-203822182.html…