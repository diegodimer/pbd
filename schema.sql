CREATE TABLE company (
    ticker_symbol VARCHAR(5) NOT NULL,
    company_name VARCHAR(15) NOT NULL,
    PRIMARY KEY(ticker_symbol)
);

CREATE TABLE tweet(
    tweet_id bigint NOT NULL,
    writer text,
    post_date bigint NOT NULL,
    body text NOT NULL,
    comment_num bigint,
    retweet_num bigint,
    like_num bigint,
    PRIMARY KEY(tweet_id)
);

CREATE TABLE company_tweet(
    tweet_id bigint NOT NULL,
    symbol VARCHAR(5) NOT NULL,
    FOREIGN KEY(tweet_id) REFERENCES tweet(tweet_id),
    FOREIGN KEY(symbol) REFERENCES company(ticker_symbol),
    PRIMARY KEY(tweet_id, symbol)
);

CREATE TABLE stock_price(
    symbol VARCHAR(5) NOT NULL,
    dt date NOT NULL,
    low_price double precision NOT NULL,
    open_price double precision NOT NULL,
    volume bigint NOT NULL,
    high_price double precision NOT NULL,
    close_price double precision NOT NULL,
    adjusted_close_price double precision NOT NULL,
    PRIMARY KEY(symbol, dt)
);

CREATE TABLE aapl(
    dt date NOT NULL,
    low_price double precision NOT NULL,
    open_price double precision NOT NULL,
    volume bigint NOT NULL,
    high_price double precision NOT NULL,
    close_price double precision NOT NULL,
    adjusted_close_price double precision NOT NULL,
    PRIMARY KEY (dt)
);
CREATE TABLE amzn(
    dt date NOT NULL,
    low_price double precision NOT NULL,
    open_price double precision NOT NULL,
    volume bigint NOT NULL,
    high_price double precision NOT NULL,
    close_price double precision NOT NULL,
    adjusted_close_price double precision NOT NULL,
    PRIMARY KEY (dt)
);
CREATE TABLE msft(
    dt date NOT NULL,
    low_price double precision NOT NULL,
    open_price double precision NOT NULL,
    volume bigint NOT NULL,
    high_price double precision NOT NULL,
    close_price double precision NOT NULL,
    adjusted_close_price double precision NOT NULL,
    PRIMARY KEY (dt)
);
-- Não achei TSLA ou GOOG/GOOGL no nasdaq

CREATE TABLE raw_tweet(
    tweet_id bigint NOT NULL,
    writer text,
    post_date bigint NOT NULL,
    body text NOT NULL,
    comment_num bigint,
    retweet_num bigint,
    like_num bigint
);

CREATE TABLE raw_company_tweet(
    tweet_id bigint NOT NULL,
    symbol VARCHAR(5) NOT NULL
);