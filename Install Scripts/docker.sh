# Instalando o Docker
sudo pacman -Syu docker

# Adicionando o USER ao grupo do Docker
sudo usermod -aG docker $USER

# Perguntando se reiniciar agora
read -p "Reiniciar agora? [Y/n] " resposta

case "$resposta" in
    [yY][eE][sS]|[yY]|"") 
        echo "Reiniciando o sistema..."
        sudo reboot
        ;;
    [nN][oO]|[nN])
        # Aplicando permissões
        echo -e "\e[31mAplicando permissões, porém o recomendado é reiniciar o PC\e[0m"
        newgrp docker
        exit 0
        ;;
    *)
        echo "Opção inválida, saindo..."
        exit 1
        ;;
esac

