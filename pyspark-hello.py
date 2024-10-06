from pyspark.sql import SparkSession

# Créer une session Spark
spark = SparkSession.builder.appName("HelloWorldApp").getOrCreate()

# Créer un DataFrame simple
data = [("Hello", "World")]
df = spark.createDataFrame(data, ["col1", "col2"])

# Afficher le DataFrame
df.show()

# Arrêter la session Spark
spark.stop()
