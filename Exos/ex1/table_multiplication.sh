#!/bin/bash

################################################################################
# Script : table_multiplication.sh
# Description : Affiche la table de multiplication d'un nombre
# Auteur : [Votre nom]
# Date : [Date]
################################################################################

# TODO: Demander un nombre à l'utilisateur
read -p "donne moi un nombre" a

# TODO: Valider que l'entrée est bien un nombre
if [ -z "$a" ]; then
    echo "ERREUR: vous devez entrer un nombre"
fi


# TODO: Afficher la table de multiplication de 1 à 10
for i in {1..10}
do
    echo "$a*$i = $(($a * $i))"
done

