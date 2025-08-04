#!/bin/bash

# Script pour mettre à jour toutes les références assets vers assets-optimized

echo "Mise à jour des références assets vers assets-optimized..."

# Fonction pour mettre à jour un fichier
update_file() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "Mise à jour: $file"
        # Remplacer les différentes variantes de chemins assets
        sed -i 's/href="assets\//href="assets-optimized\//g' "$file"
        sed -i 's/src="assets\//src="assets-optimized\//g' "$file"
        sed -i 's/href="\.\.\/assets\//href="..\/assets-optimized\//g' "$file"
        sed -i 's/src="\.\.\/assets\//src="..\/assets-optimized\//g' "$file"
        
        # Remplacer assets/plugins par assets-optimized/vendors
        sed -i 's/assets-optimized\/plugins/assets-optimized\/vendors/g' "$file"
        sed -i 's/assets-optimized\/css/assets-optimized\/brands/g' "$file"
        sed -i 's/assets-optimized\/js/assets-optimized\/brands/g' "$file"
        sed -i 's/assets-optimized\/img/assets-optimized\/images/g' "$file"
    fi
}

# Mettre à jour toutes les pages HTML des marques
for brand in cemher landerstone novacolor showroom; do
    echo "Traitement de la marque: $brand"
    
    # Page principale de la marque
    update_file "$brand/index.html"
    
    # Autres pages de la marque
    find "$brand" -name "*.html" -type f | while read file; do
        update_file "$file"
    done
done

# Mettre à jour les pages de projets Cemher
if [ -d "cemher/projets" ]; then
    find cemher/projets -name "*.html" -type f | while read file; do
        update_file "$file"
    done
fi

echo "Mise à jour terminée !"
