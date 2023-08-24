import pandas as pd
import matplotlib.pyplot as plt
import pymysql
from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database

#read data from csv
df = pd.read_csv("data.csv")

############# PLOT 1 #############

#keep necessary columns, convert date to year only, group by year, sum quantities and create new indices for df
gk = df.drop(columns=['month', 'type'])
gk['date'] = pd.DatetimeIndex(gk['date']).year
gkk = gk.groupby(['date'])['total_in_tons'].sum().reset_index()

#create bar plot
gkk.plot(x ='date', kind='bar', legend=True, width=0.8, color='#9e0142')

plt.title('Συνολικές ποσότητες ανακυκλώσιμων ειδών ανά έτος')
plt.legend(['Quantities'])
plt.xlabel('Years')
plt.ylabel('Tons')
plt.show()
plt.close()

############# PLOT 2 #############

#keep necessary columns, group by type, sum quantities and create new indices for df
jd = df.drop(columns=['date', 'month']).groupby(['type'])['total_in_tons'].sum().reset_index()

#create bar plot
jd.plot(x ='type', kind='bar', legend=True, width=0.8, color='#9e0142')

plt.title('Ανακυκλώσιμα είδη και οι ποσότητές τους')
plt.legend(['Quantities'])
plt.xlabel('Types of Waste')
plt.ylabel('Tons')
plt.show()
plt.close()

############# PLOT 3 #############

#keep necessary columns, group by month, sum quantities, sort descending and create new indices for df
hb = df.drop(columns=['date','type']).groupby(['month'])['total_in_tons'].sum().sort_values(ascending = False).reset_index()
hb = hb.head()      #keep first five

#create bar plot
hb.plot(x ='month', kind='bar', legend=True, width=0.5, color='#9e0142')

plt.title('5 μήνες με τη μεγαλύτερη ποσότητα ανακυκλώσιμων ειδών')
plt.legend(['Quantities'])
plt.xlabel('Months')
plt.ylabel('Tons')

plt.show()
plt.close()

############# SQL #############

#Credentials to database connection
hostname="localhost"
dbname="PythonProject"
uname="konstantina"
pwd="konstantina"

#Create SQLAlchemy engine to connect to MySQL Database
engine = create_engine("mysql+pymysql://{user}:{pw}@{host}/{db}"
				.format(host=hostname, db=dbname, user=uname, pw=pwd))#, echo = True
if not database_exists(engine.url):
    create_database(engine.url)  

#Convert dataframes to sql tables and create primary keys  
engine.execute('DROP TABLE IF EXISTS yearly_recycling_quantities;')                                 
gkk.to_sql('yearly_recycling_quantities', engine, index=False)

engine.execute('DROP TABLE IF EXISTS quantities_of_recyclable_waste;')                                 
jd.to_sql('quantities_of_recyclable_waste', engine, index=False)

engine.execute('DROP TABLE IF EXISTS months_highest_recyclables_quantity;')                                 
hb.to_sql('months_highest_recyclables_quantity', engine, index=False)

with engine.connect() as con:
    con.execute('ALTER TABLE `yearly_recycling_quantities` ADD id INT PRIMARY KEY AUTO_INCREMENT;')
    con.execute('ALTER TABLE `quantities_of_recyclable_waste` ADD id INT PRIMARY KEY AUTO_INCREMENT;')
    con.execute('ALTER TABLE `months_highest_recyclables_quantity` ADD id INT PRIMARY KEY AUTO_INCREMENT;')    

#Read sql tables and save to csv
yearly_recycling_quantities = pd.read_sql_table(table_name="yearly_recycling_quantities", con=engine)
yearly_recycling_quantities.to_csv('yearly_recycling_quantities.csv', index=False)

quantities_of_recyclable_waste = pd.read_sql_table(table_name="quantities_of_recyclable_waste", con=engine)
quantities_of_recyclable_waste.to_csv('quantities_of_recyclable_waste.csv', index=False)

months_highest_recyclables_quantity = pd.read_sql_table(table_name="months_highest_recyclables_quantity", con=engine)
months_highest_recyclables_quantity.to_csv('months_highest_recyclables_quantity.csv', index=False)

