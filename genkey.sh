#/bin/bash

source variables.sh


sudo strip Marbled
sudo ./Marbled -daemon
echo""
sleep 5
PRIVKEY=$(./Marbled masternode genkey)
sleep 1
echo "PRIVKEY=$PRIVKEY" >> variables.sh
sleep 1
echo "" >> $CONF_DIR/$CONF_FILE
echo "masternode=1" >> $CONF_DIR/$CONF_FILE
echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE
echo "masternodeaddr=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "externalip=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
sleep 1
echo "$ALIAS $IP:$PORT $PRIVKEY $TX $INDEX" >> $CONF_DIR/$MAST_FILE
echo ""
echo "We are now going to update the blocks to ~108000 for faster syncing"
sleep 2
sudo wget https://www.dropbox.com/s/lv6orp7jrfcr7mv/MarbleBlocks.zip?dl=1 -O blocks.zip
sleep 1
sudo unzip blocks.zip
sleep 1
sudo ./Marbled stop
sleep 1
echo ""
sudo rm -r .Marble2/blk0001.dat
sleep 1
sudo rm -r .Marble2/txleveldb
sleep 1
sudo rm -r .Marble2/database
sleep 1
sudo rm -r blocks.zip
sleep 2
sudo mv MarbleBlocks/* .Marble2/
sleep 2
sudo rm -r MarbleBlocks/
echo "$PRIVKEY"
sleep 1
echo "Please copy this private key above for your Windows setup (Highlight and press Ctrl+Insert)!"
sleep 1
echo "Starting the Marble daemon again, please wait"
sudo ./Marbled -daemon
sleep 1
echo ""
echo "Proceed to the next part of the guide"

