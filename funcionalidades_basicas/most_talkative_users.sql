-- select users that most tweet about the companies
SELECT
    symbol,
    writer as tweeteiro,
    count(comment_num) as num_tweets
FROM
    tweets_with_stock_price
where
    writer is not null
    and symbol != 'GOOG'
    and symbol != 'GOOGL'
GROUP BY
    symbol,
    writer
order by
    num_tweets desc
limit
    10;

-- MSFT	App_sw_	91640
-- AAPL	_peripherals	91424
-- AAPL	computer_hware	90899
-- AMZN	retail_Dbt	44093
-- AAPL	MacHashNews	42190
-- AAPL	PortfolioBuzz	38719
-- TSLA	markbspiegel	17954
-- TSLA	PortfolioBuzz	16070
-- AAPL	treabase	13828
-- TSLA	Commuternyc	13233
