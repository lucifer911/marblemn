# Marble Masternode Install Script

Stable and cheap host here https://kaiju.cc/budgetvps.php

MARCO address if this helped you and you love me: MDJX4GtTXzE99qZH8VWBcVPuYTX8i6459N

# This guide is meant for setting up a HOT/COLD SETUP WITH WINDOWS AND LINUX.

Use this script on a fresh install of Ubuntu 16.04 - start as root user.

# Part 1 - Sending Collateral Coins

1. Open your Windows wallet - MAKE SURE IT IS SYNCED WITH THE NETWORK
2. Go to Help -> Debug -> Console
3. Open a notepad to save the private key number and tx id
4. Type: getaccountaddress MN1
5. Send 25000 MARCO to this address
6. Go to Help -> Debug Window -> Console
7. Type: masternode outputs
8. Save your TX ID (The first number) and your Index Number (Second number, either a 1 or 0)
9. Save these with a notepad
10. Close the wallet
11. Move to Part 2 for now

# Part 2 - Getting your Linux VPS Started Up (Read all instructions and follow prompts closely)

1. Connect to your linux vps and enter the following:
2. git clone https://github.com/Duffman791/marblemn.git
3. cd marblemn/
4. bash marbleconfig.sh
5. follow the prompts closely and don't mess it up! (DO NOT CREATE A USERNAME WITH NUMBERS OR CAPS, UBUNTU DOESN'T LIKE THAT)
6. Move to Part 2

# Part 3 - Getting your Private Key and Finishing Linux Install

1. Open your VPS that's finished the first script (If not done, just wait)
2. When this is finished and you can type another command, type:
  sudo bash genkey.sh
3. Copy the Private Key given to you
4. Go to Part 4

# Part 4 - Editing your Windows Config File

1. Download this zip folder: https://github.com/Duffman791/marblemnbat/archive/master.zip
2. Extract the contents, and save the marbleconf.bat file on your Desktop
3. Run the marbleconf.bat file and enter the required information in each step
4. Start the wallet, and move to Part 5

# Part 5 - Starting the Masternode

1. In your wallet, go to Help -> Debug -> Console
2. Type masternode start-many
3. Enjoy!  You can start this process over again for another MN on a fresh Linux VPS!

# Bronate if this helped

*Official MARCO Discord: https://discord.gg/y3wxVm9

*Discord in case you need help from me personally: https://discord.gg/MwE4Fuc
  - I support multiple coins, please state which you need help with


# Recommended Tools
- SuperPutty - This allows you to have multiple Putty tabs open in one window, allowing you to easily organize and switch between masternode servers.
- Putty - Easy to use and customizable SSH client.
