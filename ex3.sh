rm ./fifo
mkfifo ./fifo

PASSWORD=$(grep -e "^PASSWORD=" .env | cut -d '=' -f 2)
AUTH="false"

function interpret () {
echo "Bienvenue sur mon serveur à caractère familial"
echo "Saisir le mot de passe :"
while read line; do
if [ "$AUTH" == "true" ];
then
echo -e '>' $(eval "$line" 2>&1)
else
if [ "$line" == "$PASSWORD" ];
then
echo "Mot de passe correct :)"
AUTH="true"
else
echo "Mot de passe incorrect :("
fi
fi
done
}

echo "Serveur démarré sur le port 12345 en localhost"
while true;
do
nc -l localhost 12345 < ./fifo | interpret > ./fifo
done