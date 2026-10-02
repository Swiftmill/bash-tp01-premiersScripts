#!/bin/bash

################################################################################
# Script : devine_nombre.sh
# Description : Jeu de devinette - trouver un nombre aléatoire
# Usage : ./devine_nombre.sh <min> <max> [difficile]
# Auteur : [Votre nom]
# Date : [Date]
################################################################################


if [ $# -ne 3 ]; then
    echo "Erreur : Vous devez fournir au moins 2 paramètres (min et max)."
    echo "Usage : $0 <min> <max> [difficile]"
    exit 1
fi

# 2. Valider que les paramètres sont bien des entiers
if ! [[ "$1" =~ ^-?[0-9]+$ ]] || ! [[ "$2" =~ ^-?[0-9]+$ ]]; then
    echo "Erreur : Les bornes <min> et <max> doivent être des nombres entiers."
    exit 1
fi

if [ "$1" -ge "$2" ]; then
    echo "Erreur : La borne min ($1) doit être inférieure à la borne max ($2)."
    exit 1
fi

min=$1
max=$2

nombre_essais=5
if [ "$3" = "difficile" ]; then
    nombre_essais=3
    echo "Mode difficile activé : vous avez seulement 3 essais !"
fi


# nombre_essais=5
# nombre=$(( $RANDOM % 100 + 1 ))

nombre=$(( RANDOM % (max - min + 1) + min ))

echo "Jeu : Devinez le nombre entre $min et $max"


trouve=0

while [ $nombre_essais -gt 0 ]; do
    echo "Nombre d'essais restants : $nombre_essais"
    read -p "Jeux : Devine un nombre entre $min et $max : " var

    echo "Votre proposition : $var"

    if [ -z "$var" ] || ! [[ "$var" =~ ^-?[0-9]+$ ]]; then
        echo "Erreur : veuillez entrer un nombre entier valide."
        continue
    fi

    # if [ $nombre -eq $var ]; then
    #     echo "Bravo vous avez trouvé le nombre !"
    #     break
    # elif [ $nombre -lt $var ]; then
    #     echo "Le nombre est plus petit"
    #     ((nombre_essais--))
    # elif [ $nombre -gt $var ]; then
    #     echo "Le nombre est plus grand"
    #     ((nombre_essais--))
    # fi

    if [ "$nombre" -eq "$var" ]; then
        echo "Bravo vous avez trouvé le nombre !"
        trouve=1
        break
    elif [ "$nombre" -lt "$var" ]; then
        echo "Le nombre est plus petit"
        ((nombre_essais--))
    elif [ "$nombre" -gt "$var" ]; then
        echo "Le nombre est plus grand"
        ((nombre_essais--))
    fi
done

if [ $nombre_essais -eq 0 ] && [ $trouve -eq 0 ]; then
    echo "Perdu ! Le nombre était : $nombre"
fi

