#!/bin/bash
echo -ne "Create folders..."
mkdir dependencies ; mkdir tools
echo "[OK]"

echo -ne "Install dependencies..."
cd /root/dependencies
apt install git -y
apt install curl -y 
apt install python -y 
apt install python3 -y 
apt install make -y  
apt install zip -y 
apt install python3-pip -y 
wget https://bootstrap.pypa.io/get-pip.py 
mv get-pip.py pip3.py 
python3 pip3.py 
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py 
mv get-pip.py pip.py 
python pip.py
rm pip.py pip3.py
wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz ; tar xvf go1.16.4.linux-amd64.tar.gz ; chown -R root:root ./go ; mv go /usr/local 
echo "export GOPATH=$HOME/go" >> /root/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> /root/.bashrc
source /root/.bashrc 
cd
echo "[OK]"

echo -ne "Install go tools..."
cd /root/tools
go get -u github.com/tomnomnom/anew ; go get -u github.com/tomnomnom/assetfinder ; go get -u github.com/ffuf/ffuf ; go get -u github.com/tomnomnom/gf ; go get github.com/hakluke/hakrawler ; go get -v github.com/projectdiscovery/httpx/cmd/httpx ; go get github.com/jaeles-project/jaeles ; go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei ; go get github.com/Emoe/kxss ; go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu ; go get -u github.com/tomnomnom/qsreplace ; go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder ; go get github.com/tomnomnom/waybackurls ; go get github.com/003random/getJS
echo "[OK]"

echo -ne "Clone git tools..."
cd tools > /dev/null 2>&1
git clone https://github.com/tomnomnom/hacks.git 
wget https://github.com/hahwul/dalfox/releases/download/v2.3.7/dalfox_2.3.7_linux_amd64.tar.gz 
tar xvf dalfox_2.3.7_linux_amd64.tar.gz 
rm LICENSE.txt README.md 
rm dalfox_2.3.7_linux_amd64.tar.gz 
wget https://github.com/Findomain/Findomain/releases/download/4.2.0/findomain-linux 
mv findomain-linux findomain 
chmod +x findomain 
wget https://github.com/brentp/gargs/releases/download/v0.3.9/gargs_linux 
mv gargs_linux gargs
chmod +x gargs 
git clone https://github.com/bp0lr/gauplus.git 
mv gauplus gauplus2 
cd gauplus2 
go build main.go 
mv main gauplus 
cp gauplus /bin 
cd /root/tools 
git clone https://github.com/jaeles-project/jaeles-signatures.git 
git clone https://github.com/blechschmidt/massdns.git 
cd massdns 
make 
cd bin 
cp massdns /bin 
cd /root/tools 
git clone https://github.com/projectdiscovery/nuclei-templates.git 
git clone https://github.com/danielmiessler/SecLists.git 
git clone https://github.com/d3mondev/puredns.git 
cd puredns
go build main.go
mv main puredns
cp puredns /bin 
cd /root/tools
git clone https://github.com/joncx0/ptf.git
cd /root/tools/ptf
wget https://raw.githubusercontent.com/joncx0/install/main/custom_ptf.txt
cp custom_ptf.txt /root/tools/ptf/modules/custom_list/
cd /root/tools/ptf
./ptf
use modules/custom_list/custom_ptf
yes
echo "[OK]"

echo -ne "Add bin directory..."
cp /root/tools dalfox findomain gargs gauplus /root/go/bin  2>&1
cp /root/go/bin/* /bin 
echo "[OK]"

echo "[Let's hack!]"
