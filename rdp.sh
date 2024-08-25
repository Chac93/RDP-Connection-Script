#!/bin/bash

# Demander l'adresse IP ou le nom de l'ordinateur distant
read -p "Entrez l'adresse IP ou le nom de l'ordinateur distant: " server

# Demander le domaine
read -p "Entrez le domaine (laissez vide si non applicable): " domain

# Demander le nom d'utilisateur
read -p "Entrez le nom d'utilisateur: " username

# Demander le mot de passe -- possibilité de mettre -s pour securiser
read -p "Entrez le mot de passe: " password
echo

# Construire la commande xfreerdp
if [ -z "$domain" ]; then
    # Si le domaine est vide, on n'inclut pas l'option /d
    command="xfreerdp /v:$server /u:$username /p:$password"
else
    # Si le domaine est fourni, on inclut l'option /d
    command="xfreerdp /v:$server /d:$domain /u:$username /p:$password"
fi

# Exécuter la commande
echo "Connexion à $server avec l'utilisateur $username..."
$command
