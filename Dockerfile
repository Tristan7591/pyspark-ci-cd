FROM python:3.12.7-slim

WORKDIR /app

# Installer Java, obligatoire pour spark
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY requirements.txt .
COPY pyspark_hello_world.py .


RUN pip install --no-cache-dir -r requirements.txt


ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64


CMD ["python", "pyspark_hello_world.py"]