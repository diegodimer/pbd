
SET datestyle='ISO, DMY';

\copy company(ticker_symbol, company_name) FROM './csv/Company.csv' DELIMITER ',' CSV HEADER;

\copy raw_company_tweet(tweet_id, symbol) FROM './csv/Company_Tweet.csv' DELIMITER ',' CSV HEADER;

\copy raw_tweet(tweet_id, writer, post_date, body, comment_num, retweet_num, like_num) FROM './csv/Tweet.csv' DELIMITER ',' CSV HEADER;

\copy amzn(dt, low_price, open_price, volume, high_price, close_price, adjusted_close_price) FROM './csv/nasdaq/csv/AMZN.csv' DELIMITER ',' CSV HEADER;

\copy aapl(dt, low_price, open_price, volume, high_price, close_price, adjusted_close_price) FROM './csv/nasdaq/csv/AAPL.csv' DELIMITER ',' CSV HEADER;

\copy msft(dt, low_price, open_price, volume, high_price, close_price, adjusted_close_price) FROM './csv/nasdaq/csv/MSFT.csv' DELIMITER ',' CSV HEADER;

\copy tsla(dt, low_price, open_price, volume, high_price, close_price, adjusted_close_price) FROM './csv/forbes2000/csv/TSLA.csv' DELIMITER ',' CSV HEADER;

SET datestyle=default;