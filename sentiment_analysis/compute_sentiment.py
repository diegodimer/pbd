import psycopg2
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
from psycopg2.extras import execute_batch

def load_tweets():
    with psycopg2.connect("host=localhost dbname=postgres user=root password=password") as conn:
        with conn.cursor() as cursor:
            load_query = """
                SELECT 
                    twsp.tweet_id,
                    twsp.body
                FROM tweets_with_stock_price twsp
            """
            cursor.execute(load_query)
            rows = cursor.fetchall()
            print('{} tweets fetched.'.format(len(rows)))
            
    return rows

def insert_sentiment_values(rows):
    with psycopg2.connect("host=localhost dbname=postgres user=root password=password") as conn:
        with conn.cursor() as cursor:
            insert_query = """
                PREPARE updateStatement 
                AS UPDATE tweets_with_stock_price
                SET sentiment=$2
                WHERE tweet_id=$1
            """
            cursor.execute(insert_query)
            execute_batch(
                cursor,
                "EXECUTE updateStatement(%s,%s)",
                rows)
            cursor.execute("DEALLOCATE updateStatement")
            conn.commit()
            print('Table updated!')
            
            
analyzer = SentimentIntensityAnalyzer()
rows = []
for r in load_tweets():
    vs = analyzer.polarity_scores(r[1])
    rows.append((r[0], vs['compound']))
print('Analyzed all tweets!')
insert_sentiment_values(rows)
print('Done')

# got it wrong
# @WSJ: Apple is being sued for falsely advertising the storage capacity of iPhones: http://on.wsj.com/13TL64c $AAPL
# {'neg': 0.0, 'neu': 1.0, 'pos': 0.0, 'compound': 0.0}

# got it right
# Insanity of today weirdo massive selling. $aapl bid up 45 cents after hours after non stop selling in trading hours
# 'compound': -0.8271




