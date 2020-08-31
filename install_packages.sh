# make sure everything is up to date
# sudo apt-get update && sudo apt-get upgrade

# install guest additions (VM only)
# sudo apt install -y virtualbox-guest-x11

# sudo apt install xclip # clipboard program
sudo apt install powercat
sudo apt install seclists
sudo apt install masscan
sudo apt install exploitdb
sudo apt install mingw-w64
sudo apt install pure-ftpd # dont forget the setup script
sudo apt install atftp # non interactive ftp for older OS's 
sudo apt install shellter # av evasion program
# sudo apt install wine >> learn how to setup first 
sudo apt install crowbar # network authentication cracking tool
sudo apt install rinetd # port forwading tool
sudo apt install httptunnel # encapsulate traffic in http tunnel, look for setup script
sudo apt install kerberoast 
sudo apt install metasploit-framework
sudo apt install nfs-common # showmount and other stuff
sudo apt install unicornscan

# setup ffuf
wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
sudo tar -xvf go1.11.linux-amd64.tar.gz
sudo mv go /usr/local
go get github.com/ffuf/ffuf
