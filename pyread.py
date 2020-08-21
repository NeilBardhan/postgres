import config
from sqlalchemy import create_engine
import pandas as pd

## Enter DBname here
config.POSTGRES_DBNAME = 'dvdrental'

## Connection string
postgres_str = ('postgresql://{username}:{password}@{ipaddress}:{port}/{dbname}'.format(username=config.POSTGRES_USERNAME,
                                                                                        password=config.POSTGRES_PASSWORD,
                                                                                        ipaddress=config.POSTGRES_ADDRESS,
                                                                                        port=config.POSTGRES_PORT,
                                                                                        dbname=config.POSTGRES_DBNAME))
## Create the connection
cnx = create_engine(postgres_str)

## Test the connection 
query = '''SELECT * FROM film;'''
film = pd.read_sql_query(query, cnx)
print(film.head(10))

## Getting all customers who have spent more than $50
query_spend = '''
SELECT 
    c.customer_id, c.first_name, c.last_name, c.store_id, 
    count(p.rental_id) as trx_count, sum(p.amount) as total_spend
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING sum(p.amount) > 50
ORDER BY c.first_name;'''

high_spend_customers = pd.read_sql_query(query_spend, cnx)
print(high_spend_customers.head(10))