#!/bin/bash

# mardi 24 mai 2016, 16:33:54 (UTC+0200)

echo "Essai en local, sans Docker. Assurez vous d'avoir adapté le 'fichier dev_config.json'."

openfire4 start

cd opt.kaiwa
sudo /home/remipassmoilesel/nodejs/bin/node server
