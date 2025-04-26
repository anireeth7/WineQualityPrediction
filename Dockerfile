# Start from a Java base image
FROM openjdk:11

# Set environment variables
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

# Create app directory
WORKDIR /app

# Copy Spark and your app files
COPY spark-3.5.0-bin-hadoop3 /opt/spark
COPY Cs643Programming2-1.0-SNAPSHOT.jar .
COPY TrainingDataset_cleaned.csv .
COPY ValidationDataset.csv .
COPY TestDataset.csv .

# Default command to run the JAR using Spark
CMD ["spark-submit", "--class", "edu.njit.cs643.jtacbianan.WineQualityPrediction", "--master", "local[*]", "Cs643Programming2-1.0-SNAPSHOT.jar"]
