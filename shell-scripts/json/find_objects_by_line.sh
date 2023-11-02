#!/bin/bash

# Nom du fichier texte contenant les objets JSON
input_file="paragraphes_extraits.txt"

# Nom du fichier CSV de sortie
output_csv="objets_extraits.csv"

# Créer l'en-tête du fichier CSV
echo "sellerId,productId,sellerProductReference,productCondition" > "$output_csv"

# Extraire les valeurs de chaque objet JSON et les ajouter au fichier CSV
while IFS= read -r line; do
    sellerId=$(echo "$line" | grep -o 'sellerId":"[^"]*' | awk -F ':"' '{print $2}' | tr -d '",')
    productId=$(echo "$line" | grep -o 'productId":"[^"]*' | awk -F ':"' '{print $2}' | tr -d '",')
    sellerProductReference=$(echo "$line" | grep -o 'sellerProductReference":"[^"]*' | awk -F ':"' '{print $2}' | tr -d '",')
    productCondition=$(echo "$line" | grep -o 'productCondition":"[^"]*' | awk -F ':"' '{print $2}' | tr -d '",')
    echo "$sellerId,$productCondition,$productId,$sellerProductReference" >> "$output_csv"
done < "$input_file"