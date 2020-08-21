import config
from sqlalchemy import create_engine
import pandas as pd

config.POSTGRES_DBNAME = 'dvdrental'
postgres_str = ('postgresql://{username}:{password}@{ipaddress}:{port}/{dbname}'.format(username=config.POSTGRES_USERNAME,
                                                                                        password=config.POSTGRES_PASSWORD,
                                                                                        ipaddress=config.POSTGRES_ADDRESS,
                                                                                        port=config.POSTGRES_PORT,
                                                                                        dbname=config.POSTGRES_DBNAME))
# Create the connection
cnx = create_engine(postgres_str)
query = '''SELECT * FROM film;'''
film = pd.read_sql_query(query, cnx)
print(film.head(10))