
#!/bin/bash

# Nom du premier fichier CSV
fichier1="fichier2.csv"

# Nom du deuxième fichier CSV
fichier2="fichier_finals.csv"

# Nom du fichier de sortie pour les différences
fichier_diff="differences.csv"

# Boucle pour parcourir le premier fichier ligne par ligne
while IFS=, read -r SELLER_ID PRODUCT_ID PRODUCT_CONDITION_CODE
do
  # Rechercher si la ligne existe dans le deuxième fichier
  matching_lines=$(grep -i "^$SELLER_ID,$PRODUCT_ID" "$fichier2")
  if [ -n "$matching_lines" ]; then
      echo "Non"
  else
      echo "$SELLER_ID,$PRODUCT_ID,$PRODUCT_CONDITION_CODE" >> "diff.csv"
  fi

done < "$fichier1"
