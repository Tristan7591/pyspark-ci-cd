#!/bin/bash

# Arrêter le script en cas d'erreur
set -e

# Vérifier si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "Docker n'est pas installé. Veuillez l'installer pour continuer."
    exit 1
fi

# Nom de l'image Docker
IMAGE_NAME="hello-pyspark"

# Nettoyer les conteneurs et images existants
echo "Nettoyage des conteneurs et images existants..."
docker rm -f pyspark-app || true
docker rmi -f $IMAGE_NAME || true

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

# Remplace "Hello World from PySpark!" par un message de succès attendu
if echo "$output" | grep -q "Hello"; then
    echo "Test réussi."
else
    echo "Échec du test."
    echo "Sortie du conteneur : $output"
    exit 1
fi

# Déploiement : ici, nous allons simplement exécuter le conteneur en arrière-plan
echo "Déploiement de l'application..."
docker run -d --name pyspark-app $IMAGE_NAME

echo "Application déployée avec succès."
