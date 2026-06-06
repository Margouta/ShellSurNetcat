#!/bin/bash

function envoyer_commandes () {
    while read ma_ligne; do
        echo "$ma_ligne" | ./encode.sh
    done
}

function recevoir_reponses () {
    while read reponse_serveur; do
        echo "$reponse_serveur" | ./decode.sh
    done
}

envoyer_commandes | nc localhost 12345 | recevoir_reponses