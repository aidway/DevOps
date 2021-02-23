# 1. pyhive
from pyhive import hive
import pandas as pd

def getData(sql):
    cur = CONN_INCEPTOR.cursor()      
    cur.execute(sql)
    columns = [col[0] for col in cursor.description]
    result = [dict(zip(columns, row)) for row in cursor.fetchall()]
    data = pd.DataFrame(result)
    data.columns = columns 
    cur.close()
    return data
 
CONN_INCEPTOR = hive.Connection(host='10.10.110.47',port=10000,auth='LDAP',database='mssad_db',username='mssad',password='mssad')
sql = "select * from system.dual"
df  = getData(sql)



# 2. impala
from impala.dbapi import connect
from impala.util import as_pandas

def getData(sql):
    '''作用：根据输入的日期，获取特征数据'''
    con = connect(**INCEPTOR_CONFIG)
    cur = con.cursor()
    cur.execute(sql)
    df_data = as_pandas(cur)
    cur.close()
    return df_data
    

INCEPTOR_CONFIG = dict(host=Host,port=Port,user=User,password=Password,database=Database,auth_mechanism='PLAIN')



# 3. pyodbc
import pyodbc
def getData(trade_date,commid,commid_type,pred_results,table_name):
    '''将预测结果写入inceptor'''
    db = pyodbc.connect(CONN)
    cursor = db.cursor()
    cursor.execute()
    cursor.close()
    
CONN = "Driver= %s;Server =%s;Hive=%s;Host=%s,Port=%s;Database=%s;User =%s;Password=%s;Mech=%s" %(Driver, Server, Hive, Host, Port, Database, User, Password, 'LDAP')

