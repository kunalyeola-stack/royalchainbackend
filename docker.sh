#!/bin/bash

# ==========================================
# Kubernetes Namespace + Run Containers
# Kafka + Redis + PostgreSQL
# ==========================================

NAMESPACE="backend-services"

echo "=========================================="
echo " Creating Namespace: $NAMESPACE"
echo "=========================================="

# Create Namespace
kubectl create namespace $NAMESPACE

echo ""
echo "=========================================="
echo " Pulling Docker Images"
echo "=========================================="

docker pull bitnami/zookeeper:latest
docker pull bitnami/kafka:latest
docker pull redis:latest
docker pull postgres:latest

echo ""
echo "=========================================="
echo " Running Containers"
echo "=========================================="

# ==========================================
# Run Zookeeper
# ==========================================

docker run -d \
--name zookeeper \
-p 2181:2181 \
-e ALLOW_ANONYMOUS_LOGIN=yes \
bitnami/zookeeper:latest

# ==========================================
# Run Kafka
# ==========================================

docker run -d \
--name kafka \
-p 9092:9092 \
-e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181 \
-e ALLOW_PLAINTEXT_LISTENER=yes \
-e KAFKA_CFG_LISTENERS=PLAINTEXT://:9092 \
-e KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
--link zookeeper:zookeeper \
bitnami/kafka:latest

# ==========================================
# Run Redis
# ==========================================

docker run -d \
--name redis \
-p 6379:6379 \
redis:latest

# ==========================================
# Run PostgreSQL
# ==========================================

docker run -d \
--name postgres \
-p 5432:5432 \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_DB=mydb \
postgres:latest

echo ""
echo "=========================================="
echo " Running Containers"
echo "=========================================="

docker ps

echo ""
echo "=========================================="
echo " Setup Completed Successfully"
echo "=========================================="

echo ""
echo "Kafka          : localhost:9092"
echo "Redis          : localhost:6379"
echo "PostgreSQL     : localhost:5432"
echo "Postgres DB    : mydb"
echo "Postgres User  : postgres"
echo "Postgres Pass  : postgres"
echo ""