#!/bin/bash

################################################################################
# Script : renommer_fichiers.sh
# Description : Renomme les fichiers .txt d'un dossier
#               - Remplace les espaces par des underscores
#               - Convertit en minuscules
#               - Ajoute un préfixe avec la date
# Usage : ./renommer_fichiers.sh <dossier> [--dry-run]
# Auteur : [Votre nom]
# Date : [Date]
################################################################################

# TODO: Vérifier qu'un dossier est fourni en paramètre
if [ $# -eq 0 ]; then
    echo "Erreur : Vous devez fournir un dossier en paramètre."
    echo "Usage : $0 <dossier> [--dry-run]"
    exit 1
fi

dossier=$1

# TODO: Vérifier que le dossier existe
if [ ! -d "$dossier" ]; then
    echo "Erreur : Le dossier '$dossier' n'existe pas."
    exit 1
fi

# TODO: Récupérer la date du jour au format AAAAMMJJ
date_prefix=$(date +"%Y%m%d")

# TODO: Initialiser les compteurs
compteur=0

# TODO: Boucler sur tous les fichiers .txt du dossier
for fichier in "$dossier"/*.txt; do
# TODO: Pour chaque fichier :
#       - Extraire le nom sans extension
#       - Remplacer les espaces par des underscores
#       - Convertir en minuscules
#       - Créer le nouveau nom avec le préfixe
    nom_sans_extension=$(basename "$fichier" .txt)
    nouveau_nom=$(echo "$nom_sans_extension" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
    nouveau_nom="$date_prefix-$nouveau_nom.txt"

    # Vérifier si l'option --dry-run est présente
    if [ "$2" = "--dry-run" ]; then
        echo "Dry run : $fichier -> $nouveau_nom"
    else
        mv "$fichier" "$dossier/$nouveau_nom"
        echo "Renommé : $fichier -> $nouveau_nom"
    fi

    ((compteur++))
done

# TODO: Afficher le résumé des opérations
echo "$compteur fichiers ont été renommés"
