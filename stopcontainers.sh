# filepath: /home/islan-p/meus-scripts/stopcontainers.sh
# ...código existente...
CONTAINERS=$(sudo docker ps -q)
if [ -z "$CONTAINERS" ]; then
  echo "Nenhum container em execução."
else
  sudo docker stop $CONTAINERS
fi