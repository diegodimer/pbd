-- Verificar surtos de interesse: analisar períodos em que usuários 
-- que nunca haviam comentado sobre uma empresa passaram a comentar
WITH first_tweet as (
    SELECT 
        writer,
        symbol,
        MIN(dt) as dt
    FROM
        tweets_with_stock_price
    WHERE 
        writer IS NOT NULL
        AND symbol IS NOT NULL 
        AND dt IS NOT NULL
    GROUP BY 
        writer,symbol
)
SELECT 
    dt as "time",
    count(1) as "number_first_tweets"
FROM 
    first_tweet
WHERE 
    symbol = 'TSLA'
GROUP BY 
    dt



-- sentiment
WITH no_repeated AS (
	SELECT DISTINCT ON (body,dt) 
		*	
	FROM tweets_with_stock_price tweet
) 
SELECT
  dt as "time",
  AVG(sentiment)*5000 as "sentiment"
FROM
  no_repeated
WHERE
--   symbol = 'AAPL' and dt is not null
   symbol = 'TSLA' and dt is not null
--  symbol = 'AAPL' and dt is not null
--   symbol = 'TSLA' and dt is not null
GROUP BY dt;


-- stock value
SELECT
  dt as "time",
  high_price*20 as "tsla_stock_price"
FROM
  tsla
WHERE dt >= '2015-01-01'
  AND dt < '2020-01-01';

-- by far the day when TSLA attracted the most amount
-- of attention was in 2018-08-07, when it announced 
-- it would start hiring for a new 2 billion factory in Shangai
-- https://www.reuters.com/article/us-tesla-china-idUSKBN1KS0WQ