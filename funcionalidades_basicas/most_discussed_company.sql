-- controversy
SELECT 
    symbol,
    SUM(comment_num) AS controversy
FROM
    tweets_with_stock_price
GROUP BY
    symbol
ORDER BY controversy DESC
-- TSLA	762813
-- AAPL	222048
-- AMZN	152200
-- GOOGL 58619
-- MSFT	41533
-- GOOG	30704