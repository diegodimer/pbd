-- top 10 writers about apple
select t.writer, count(t.tweet_id) as username from
(select tweet_id from company_tweet ct where symbol = 'AAPL') ct join tweet t on ct.tweet_id = t.tweet_id 
group by t.writer order by count(t.tweet_id) desc limit 5;
-- _peripherals	    91424
-- computer_hware	90899
-- MacHashNews	    42190
-- PortfolioBuzz	38719
-- treabase	        13828
