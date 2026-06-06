rm ./fifo
mkfifo ./fifo

PASSWORD=$(grep -e "^PASSWORD=" .env | cut -d '=' -f 2)
AUTH="false"

function interpret () {
echo "Bienvenue sur mon serveur à caractère familial" | ./encode.sh
echo "Saisir le mot de passe :" | ./encode.sh
while read line; do
line=$(echo $line | ./decode.sh)
if [ "$AUTH" == "true" ];
then
if [ "$line" == "exit" ];
then
echo "Déconnexion du client" | ./encode.sh
exit
fi
echo -e '>' $(eval "$line" 2>&1) | ./encode.sh
else
if [ "$line" == $(eval "$PASSWORD" | tr '[:upper:]' '[:lower:]') ];
then
echo "Mot de passe correct :)" | ./encode.sh
AUTH="true"
else
echo "Mot de passe incorrect :(" | ./encode.sh
echo "Saisir le mot de passe :" | ./encode.sh
fi
fi
done
}

echo "Serveur démarré sur le port 12345 en localhost"
while true;
do
nc -l localhost 12345 < ./fifo | interpret > ./fifo
done