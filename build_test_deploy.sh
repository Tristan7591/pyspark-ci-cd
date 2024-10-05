#!/bin/bash

# Nom de l'image Docker
IMAGE_NAME="pyspark-hello-world"

# Construire l'image Docker
echo "Construction de l'image Docker..."
docker build -t $IMAGE_NAME .

# Vérifier si la construction a réussi
if [ $? -eq 0 ]; then
    echo "Construction de l'image réussie."
else
    echo "Échec de la construction de l'image."
    exit 1
fi

# Test simple : exécuter le conteneur et vérifier la sortie
echo "Exécution du test..."
output=$(docker run --rm $IMAGE_NAME)

if echo "$output" | grep -q "Hello World from PySpark!"; then
    echo "Test réussi."
else
    echo "Échec du test."
    exit 1
fi

# Déploiement : ici, nous allons simplement exécuter le conteneur en arrière-plan
echo "Déploiement de l'application..."
docker run -d --name pyspark-app $IMAGE_NAME

echo "Application déployée avec succès."