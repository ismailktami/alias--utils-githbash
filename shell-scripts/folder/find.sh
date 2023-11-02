#! bash/bin -e

# find "$1" -maxdepth 1 -type d | while read -r folder; do
#     echo $folder
#     if [ -e "$folder/.gitkeep" ]; then
#         rm  $folder/.gitkeep
#     fi
# done


#!/bin/bash

# Dossier de départ où vous souhaitez commencer le processus de renommage
dossier_de_depart="$1"

# cp  -r $1  "$1/../backup"
a="Check The Navigation to"
b="Check The Navigation To"
rename_recursive() {
    local chemin="$1"
    for element in "$chemin"/*; do
        if [[ -d "$element" ]]; then
            rename_recursive "$element"
        elif [[ -f "$element" ]]; then
            echo $element
            sed -i "s/$a/$b/" "$element"
        fi
    done
}

# Appel de la fonction pour renommer les dossiers et fichiers
rename_recursive "$dossier_de_depart"
