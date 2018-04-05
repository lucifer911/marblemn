#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*    MARCO Masternode         *"
echo "*        SETUP                *"
echo "*         BY                  *"
echo "*        TPOT                 *"
echo "*                             *"
echo "*                             *"
echo "*******************************"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

echo "Please enter a NEW (NOT ROOT AND NO NUMBERS AND NO CAPS) username : "
read USR
sleep 1
echo "Please enter a NEW password : "
read PSSWD
sleep 1
sudo adduser $USR --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
sleep 1
echo "$USR:$PSSWD" | sudo chpasswd
sleep 1
sudo adduser $USR sudo
sleep 1
echo "Please enter the IP Address of your server (WITHOUT PORT): "
read IP
echo "Please enter the TX ID you got from your Windows Wallet: "
read TX
echo "Please enter the Index number you got from your Windows Wallet (0 or a 1): "
read INDEX
echo "Please enter a name for your masternode: "
read ALIAS

echo "TX=$TX" >> variables.sh
sleep 1
echo "INDEX=$INDEX" >> variables.sh
sleep 1
echo "ALIAS=$ALIAS" >> variables.sh
sleep 1
echo "USR=$USR" >> variables.sh
sleep 1
echo "PASSWORD=$PSSWD" >> variables.sh
sleep 1
echo "IP=$IP" >> variables.sh
sleep 1
echo "PORT=32427" >> variables.sh
sleep 1
echo "CONF_DIR=/home/$USER/.Marble2" >> variables.sh
sleep 1
echo "CONF_FILE=Marble2.conf" >> variables.sh
sleep 1
echo "MAST_FILE=masternode.conf" >> variables.sh
sleep 1

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y install unzip
sudo apt-get -y install aptitude
sudo aptitude -y install libgmp3-dev
sudo aptitude -y install software-properties-common build-essential
sudo aptitude -y install libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils git cmake libboost-all-dev zlib1g-dev libz-dev libseccomp-dev libcap-dev libminiupnpc-dev
sudo aptitude -y install libminiupnpc10 libzmq5
sudo aptitude -y install libcanberra-gtk-module libqrencode-dev libzmq3-dev
sudo aptitude -y install libqt5gui5 libqt5core5a libqt5webkit5-dev libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get -y update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev libdb5.3 libdb5.3++
  
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw allow 32427/tcp
sudo ufw status


sudo wget https://github.com/MarbleCoin/Wallets/raw/master/Marble2-2201-Linux.zip -O Marble2.zip
sleep 1
sudo unzip Marble2.zip
sleep 1
sudo rm Marble2.zip
sleep 1
sudo rm Marble-qt
sleep 1
sudo chmod +x Marbled
sleep 1
sudo mv Marbled /home/$USER
sleep 1
sudo mv ~/marblemn/variables.sh /home/$USER
sleep 1
sudo mv ~/marblemn/genkey.sh /home/$USER
sleep 1
echo ""
echo ""
echo ""
echo "Part one is done, please enter the command: sudo bash genkey.sh"
su - $USR
