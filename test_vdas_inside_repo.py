# Databricks notebook source
storageAccountName = "adlsv2dbrickspoc"
sasKey = "?sv=2021-06-08&ss=b&srt=sco&sp=rwdlacyx&se=2022-12-03T14:49:57Z&st=2022-11-02T06:49:57Z&spr=https&sig=yn9FV%2BsGFdJ7K6X%2FZ6RhxT0Rn1J%2B%2FAe3u1UIn%2BaNj%2FI%3D"
blobContainerName = "raw"
mntPoint="/mnt/"+blobContainerName
print(mntPoint)
try:
    dbutils.fs.unmount(mntPoint)
except:
    println(mntPoint, " already unmounted")

extra_configs = {"fs.azure.sas.{0}.{1}.blob.core.windows.net".format(blobContainerName,storageAccountName): sasKey}
print(extra_configs)
sourceString = "wasbs://{}@{}.blob.core.windows.net/".format(blobContainerName, storageAccountName)
try:
  dbutils.fs.mount(
  source = sourceString,
  mount_point = mntPoint,
  extra_configs = {"fs.azure.sas.{0}.{1}.blob.core.windows.net".format(blobContainerName,storageAccountName): sasKey}
  )
except Exception as e:
  print("already mounted. Try to unmount first")

# COMMAND ----------

df = (spark.read
  .format("parquet")
  .load("/mnt/raw/vdas_parquet")
)
display(df)

# COMMAND ----------

df.count()

# COMMAND ----------

#from test_vdsas import abbr_destination
from test_vdas_issue import test_vdsas
test_vdsas.abbr_destination('Test')

# COMMAND ----------

df.createOrReplaceTempView('vdas')

# COMMAND ----------

from test_vdas_issue import test_vdsas
spark.udf.register("test_vdsas_abbr_destination", test_vdsas.abbr_destination)

# COMMAND ----------


df2=spark.sql("select delay,distance,origin,destination,test_vdsas_abbr_destination(destination) derived_destination from vdas")

# COMMAND ----------

df2.count()

# COMMAND ----------

display(df2)
