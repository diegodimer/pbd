INSERT INTO stock_price(
    SELECT 'AAPL',* 
    FROM aapl
);

INSERT INTO stock_price(
    SELECT 'AMZN',* 
    FROM amzn
);

INSERT INTO stock_price(
    SELECT 'MSFT',* 
    FROM msft
);

INSERT INTO stock_price(
    SELECT 'TSLA',* 
    FROM tsla
);

CREATE TABLE tweets_with_stock_price AS (
    SELECT 
        tweet.tweet_id, 
        tweet.writer, 
        tweet.post_date, 
        tweet.body, 
        tweet.comment_num, 
        tweet.retweet_num, 
        tweet.like_num,
        company_tweet.symbol,
        stock_price.dt, 
        stock_price.low_price, 
        stock_price.open_price, 
        stock_price.volume, 
        stock_price.high_price, 
        stock_price.close_price, 
        stock_price.adjusted_close_price
    FROM tweet
    LEFT JOIN company_tweet
    ON tweet.tweet_id = company_tweet.tweet_id
    LEFT JOIN stock_price
    ON (to_timestamp(tweet.post_date)::DATE = stock_price.dt
        AND company_tweet.symbol = stock_price.symbol)
);