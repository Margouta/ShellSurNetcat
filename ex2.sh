rm ./fifo
mkfifo ./fifo

function interpret () {
echo "Bienvenue sur mon serveur à caractère familial"
while read line;
do
echo -e '>' $(eval $line 2>&1)
done
}
echo "Serveur démarré sur le port 12345 en localhost"
while true;
do
nc -l localhost 12345 < ./fifo | interpret > ./fifo
done