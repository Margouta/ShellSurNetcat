rm ./fifo
mkfifo ./fifo

function interpret () {
echo $(date)
echo "Bienvenue sur mon serveur à caractère familial"
}
echo "Serveur démarré sur le port 12345 en localhost"
while true;
do
nc -l localhost 12345 < ./fifo | interpret > ./fifo
done
