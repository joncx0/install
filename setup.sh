#!/bin/bash
echo -ne "Create folders..."
mkdir dependencies ; mkdir tools
echo "[OK]"

echo -ne "Install dependencies..."
cd /root/dependencies > /dev/null 2>&1 
apt install git -y > /dev/null 2>&1
apt install curl -y > /dev/null 2>&1
apt install python -y > /dev/null 2>&1
apt install python3 -y > /dev/null 2>&1
apt install make -y > /dev/null 2>&1 
apt install zip -y > /dev/null 2>&1
wget https://bootstrap.pypa.io/get-pip.py > /dev/null 2>&1
mv get-pip.py pip3.py > /dev/null 2>&1
python3 pip3.py > /dev/null 2>&1
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py > /dev/null 2>&1
mv get-pip.py pip.py > /dev/null 2>&1
python pip.py > /dev/null 2>&1
rm pip.py pip3.py
wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz ; tar xvf go1.16.4.linux-amd64.tar.gz ; chown -R root:root ./go ; mv go /usr/local 
echo "export GOPATH=$HOME/go" >> /root/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> /root/.bashrc
source /root/.bashrc > /dev/null 2>&1
cd
echo "[OK]"

echo -ne "Install go tools..."
cd /root/tools > /dev/null 2>&1
go get -u github.com/tomnomnom/anew > /dev/null 2>&1 
go get -u github.com/tomnomnom/assetfinder > /dev/null 2>&1 
go get -u github.com/ffuf/ffuf > /dev/null 2>&1 
go get -u github.com/tomnomnom/gf > /dev/null 2>&1
go get github.com/hakluke/hakrawler > /dev/null 2>&1
go get -v github.com/projectdiscovery/httpx/cmd/httpx > /dev/null 2>&1
go get github.com/jaeles-project/jaeles > /dev/null 2>&1
go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei > /dev/null 2>&1 
go get github.com/Emoe/kxss > /dev/null 2>&1
go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu > /dev/null 2>&1
go get -u github.com/tomnomnom/qsreplace > /dev/null 2>&1
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder > /dev/null 2>&1
go get github.com/tomnomnom/waybackurls > /dev/null 2>&1
go get github.com/003random/getJS > /dev/null 2>&1
echo "[OK]"

echo -ne "Clone git tools..."
cd tools > /dev/null 2>&1
git clone https://github.com/tomnomnom/hacks.git > /dev/null 2>&1
wget https://github.com/hahwul/dalfox/releases/download/v2.3.7/dalfox_2.3.7_linux_amd64.tar.gz > /dev/null 2>&1
tar xvf dalfox_2.3.7_linux_amd64.tar.gz > /dev/null 2>&1 
rm LICENSE.txt README.md > /dev/null 2>&1 
rm dalfox_2.3.7_linux_amd64.tar.gz > /dev/null 2>&1
wget https://github.com/Findomain/Findomain/releases/download/4.2.0/findomain-linux > /dev/null 2>&1
mv findomain-linux findomain > /dev/null 2>&1
chmod +x findomain > /dev/null 2>&1
wget https://github.com/brentp/gargs/releases/download/v0.3.9/gargs_linux > /dev/null 2>&1
mv gargs_linux gargs > /dev/null 2>&1 
chmod +x gargs > /dev/null 2>&1
git clone https://github.com/bp0lr/gauplus.git > /dev/null 2>&1
mv gauplus gauplus2 > /dev/null 2>&1
cd gauplus2 > /dev/null 2>&1
go build main.go > /dev/null 2>&1
mv main gauplus > /dev/null 2>&1
cp gauplus /bin > /dev/null 2>&1
cd /root/tools > /dev/null 2>&1
git clone https://github.com/jaeles-project/jaeles-signatures.git > /dev/null 2>&1
git clone https://github.com/blechschmidt/massdns.git > /dev/null 2>&1 
cd massdns > /dev/null 2>&1 
make > /dev/null 2>&1 
cd bin > /dev/null 2>&1 
cp massdns /bin > /dev/null 2>&1 
cd /root/tools > /dev/null 2>&1 > /dev/null 2>&1
git clone https://github.com/projectdiscovery/nuclei-templates.git > /dev/null 2>&1
git clone https://github.com/danielmiessler/SecLists.git > /dev/null 2>&1
git clone https://github.com/d3mondev/puredns.git > /dev/null 2>&1
cd puredns > /dev/null 2>&1
go build main.go > /dev/null 2>&1
mv main puredns > /dev/null 2>&1
cp puredns /bin > /dev/null 2>&1
cd /root/tools > /dev/null 2>&1
git clone https://github.com/joncx0/ptf.git > /dev/null 2>&1
cd /root/tools/ptf > /dev/null 2>&1
wget https://raw.githubusercontent.com/joncx0/install/main/custom_ptf.txt > /dev/null 2>&1
cp custom_ptf.txt /root/tools/ptf/modules/custom_list/ > /dev/null 2>&1
cd /root/tools/ptf > /dev/null 2>&1
./ptf
use modules/custom_list/custom_ptf
yes
echo "[OK]"

echo -ne "Add bin directory..."
cp /root/tools dalfox findomain gargs gauplus /root/go/bin > /dev/null 2>&1
cp /root/go/bin/* /bin > /dev/null 2>&1
echo "[OK]"

echo "[Let's hack!]"
