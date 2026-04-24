# Instalando o Docker
sudo pacman -Syu docker

# Adicionando o USER ao grupo do Docker
sudo usermod -aG docker $USER

# Aplicando permissões 
echo -e "\e[31mAplicando permissões, porém o recomendado é reiniciar o PC\e[0m"
newgrp docker
