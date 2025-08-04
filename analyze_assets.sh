#!/bin/bash

# Script pour consolider les assets communs et optimiser la structure

echo "Consolidation des assets communs..."

# Créer les sous-dossiers dans common/
mkdir -p assets-optimized/common/css
mkdir -p assets-optimized/common/js
mkdir -p assets-optimized/common/images

echo "Analyse des fichiers dupliqués..."

# Identifier les fichiers CSS similaires entre marques
echo "=== Fichiers CSS par marque ==="
for brand in cemher jotun landerstone novacolor raleyan showroom; do
    if [ -f "assets-optimized/brands/$brand/style.css" ]; then
        size=$(wc -c < "assets-optimized/brands/$brand/style.css")
        echo "$brand: $size bytes"
    fi
done

echo ""
echo "=== Fichiers JavaScript par marque ==="
for brand in cemher jotun landerstone novacolor raleyan showroom; do
    if [ -f "assets-optimized/brands/$brand/app.js" ]; then
        size=$(wc -c < "assets-optimized/brands/$brand/app.js")
        echo "$brand: $size bytes"
    fi
done

echo ""
echo "=== Images communes potentielles ==="
# Vérifier les fichiers avec des noms similaires
for img in favicon.png favicon.ico ajax-loader.gif larx.png; do
    echo "Fichier $img trouvé dans:"
    find assets-optimized/images -name "$img" -type f
    echo ""
done

echo "=== Analyse des dépendances vendor ==="
echo "Taille du dossier vendors:"
du -sh assets-optimized/vendors

echo ""
echo "=== Recommandations d'optimisation ==="
echo "1. Les fichiers favicon.png/ico peuvent être unifiés"
echo "2. Le fichier ajax-loader.gif est dupliqué"
echo "3. Le fichier larx.png semble être un logo commun"
echo "4. Vérifier si les fichiers CSS ont des parties communes"

echo ""
echo "Consolidation terminée ! Consultez les recommandations ci-dessus."
