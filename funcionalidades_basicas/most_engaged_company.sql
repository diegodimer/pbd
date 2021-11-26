-- engagement
SELECT 
    symbol,
    SUM(like_num) AS total_likes,
    SUM(retweet_num) AS total_retweets,
    SUM(like_num) + SUM(retweet_num) AS engagement
FROM
    tweets_with_stock_price
GROUP BY
    symbol
ORDER BY engagement DESC
-- TSLA	5769051	1078386	6847437
-- AAPL	1378670	722396	2101066
-- AMZN	984166	419783	1403949
-- GOOGL 406917	191550	598467
-- MSFT	347520	193364	540884
-- GOOG	235928	147143	383071

