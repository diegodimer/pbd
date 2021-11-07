INSERT INTO tweet(tweet_id, writer, post_date, body, comment_num, retweet_num, like_num) (
    SELECT *
    FROM raw_tweet
) ON CONFLICT DO NOTHING;

INSERT INTO company_tweet(tweet_id, symbol) (
    SELECT *
    FROM raw_company_tweet
) ON CONFLICT DO NOTHING;

