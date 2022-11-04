from pyspark.sql.functions import lit
from datetime import datetime

def test_repos_func(df):
    df1=df.withColumn('return_current_timestamp',lit(datetime.now()))
    return df1

def case_convert(str):
    return str.lower()