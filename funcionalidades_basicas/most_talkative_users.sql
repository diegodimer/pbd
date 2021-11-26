-- top 10 writers about apple
select t.writer, count(t.tweet_id) as username from
(select tweet_id from company_tweet ct where symbol = 'AAPL') ct join tweet t on ct.tweet_id = t.tweet_id 
group by t.writer order by count(t.tweet_id) desc limit 10;


