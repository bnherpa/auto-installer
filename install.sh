#--------------------------------------------------
#Softether auto install script
#Debian and Ubuntu
#--------------------------------------------------
cd /root
apt-get update -y
apt-get install build-essential -y
#Downloading server files
wget http://www.softether-download.com/files/softether/v4.32-9731-beta-2020.01.01-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.32-9731-beta-2020.01.01-linux-x64-64bit.tar.gz
tar zxf softether-vpnserver-v4.32-9731-beta-2020.01.01-linux-x64-64bit.tar.gz
cd vpnserver
#Installing server files, Manual input
clear
echo  -e "\033[31;7mNOTE: ANSWER 1 AND ENTER THREE TIMES FOR THE COMPILATION TO PROCEED\033[0m"
make
cd /root
mv vpnserver /usr/local
rm -rf softether-vpnserver-v4.32-9731-beta-2020.01.01-linux-x64-64bit.tar.gz
cd /usr/local/vpnserver
chmod 600 *
chmod 700 vpncmd
chmod 700 vpnserver
#Installing server command
wget https://raw.githubusercontent.com/Anonghost720/SoftEther-Autoinstal-Ubuntu-Debian/master/vpn-server.sh --no-check-certificate
mv vpn-server.sh /etc/init.d/vpnserver
cd /etc/init.d/
chmod 755 vpnserver
update-rc.d vpnserver defaults
/etc/init.d/vpnserver start
cd /usr/local/vpnserver
echo ---------------------------------------------
echo  -e "\033[32;5mSoftether Was Successfully Installed By Bn herpa.\033[0m"
echo "vpncmd is at /usr/local/vpnserver"
echo ---------------Commands----------------------
echo /etc/init.d/vpnserver start - to start
echo /etc/init.d/vpnserver restart - to restart
echo /etc/init.d/vpnserver stop - to stop
echo ---------------------------------------------
#End of script
