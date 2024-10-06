
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3.10 python3.10-dev python3-pip \
    openjdk-11-jdk \
    && apt-get clean

RUN ln -sf /usr/bin/python3.10 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

COPY requirement.txt /app/requirement.txt
RUN pip install --upgrade pip && pip install -r /app/requirement.txt

COPY pyspark-hello.py /app/pyspark-hello.py

WORKDIR /app

CMD ["python", "pyspark-hello.py"]
