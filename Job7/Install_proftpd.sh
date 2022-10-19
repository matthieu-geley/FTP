#!/bin/bash

#1. Installation : 

#On met à jour la liste des paquets

echo -e "mise à jour des paquets\n"

sudo apt update

#Puis on installe proftpd

echo -e "installation proftpd\n"
sudo apt-get install proftpd-*

#2. Configuration :

#modification shell

echo -e "modification shell\n"

sudo cp /etc/shells /etc/shells.old
echo "/bin/false" >> /etc/shells

#Création de la blacklist :

#echo -e "création blacklist\n"
sudo cat /etc/passwd | cut -d: -f1 > /etc/ftpusers 

#Les utilisateurs :

echo -e "création User\n"
sudo useradd --force-badname -p kalimac Merry -s /bin/false
sudo useradd --force-badname -p secondbreakfast Pippin -s /bin/false

#3. Configuration de Proftpd

#On active la balcklist

sudo echo "UseFtpUsers on" >> /etc/proftpd/proftpd.conf

#4. Lancement du serveur FTP

#On redémarre le serveur FTP

sudo service proftpd restart