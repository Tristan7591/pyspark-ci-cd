from pyspark.sql import SparkSession

def main():
    # Initialiser une session Spark
    spark = SparkSession.builder \
        .appName("HelloWorldPySpark") \
        .getOrCreate()

    # Créer un DataFrame simple
    df = spark.createDataFrame([(1, "Hello"), (2, "World")], ["id", "message"])

    # Afficher le contenu du DataFrame
    df.show()

    print("Hello World from PySpark!")

    # Arrêter la session Spark
    spark.stop()

if __name__ == "__main__":
    main()