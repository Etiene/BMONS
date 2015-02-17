echo "


    ██████╗ ███╗   ███╗ ██████╗ ███╗   ██╗███████╗        
    ██╔══██╗████╗ ████║██╔═══██╗████╗  ██║██╔════╝        
    ██████╔╝██╔████╔██║██║   ██║██╔██╗ ██║███████╗        
    ██╔══██╗██║╚██╔╝██║██║   ██║██║╚██╗██║╚════██║        
    ██████╔╝██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████║        
    ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝        
                                                          
    ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗      
    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗     
    ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝     
    ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗     
    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║     
    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝     
                                                          
    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                                                          
                                                      
=======================================================

    ██████╗ ██╗   ██╗██████╗ ██╗   ██╗
    ██╔══██╗██║   ██║██╔══██╗╚██╗ ██╔╝
    ██████╔╝██║   ██║██████╔╝ ╚████╔╝ 
    ██╔══██╗██║   ██║██╔══██╗  ╚██╔╝  
    ██║  ██║╚██████╔╝██████╔╝   ██║   
    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝    ╚═╝   
                                      
=======================================================";

#sudo apt-get update
sudo apt-get install git git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

git config --global color.ui true
git config --global user.name "Etiene Dalcol"
git config --global user.email "dalcol@etiene.net"
git config --global http.proxy "http://192.168.1.17:8080"

wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz
tar -xzvf ruby-2.1.5.tar.gz
cd ruby-2.1.5/
./configure
make
sudo make install
ruby -v
cd ../
rm ruby-2.1.5.tar.gz
rm -r -f ruby-2.1.5

export PATH=$PATH:/home/bmons/.gem/ruby/1.8/bin
export PATH=$PATH:/usr/lib/ruby/gems/1.8/bin
sudo gem install --http-proxy http://192.168.1.17:8080 rails -V
rails -v
sudo gem install --http-proxy http://192.168.1.17:8080 bundler -V
bundle install


echo "=======================================================

██████╗  ██████╗ ███████╗████████╗ ██████╗ ██████╗ ███████╗███████╗ ██████╗ ██╗     
██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔════╝ ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║     
██████╔╝██║   ██║███████╗   ██║   ██║  ███╗██████╔╝█████╗  ███████╗██║   ██║██║     
██╔═══╝ ██║   ██║╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  ╚════██║██║▄▄ ██║██║     
██║     ╚██████╔╝███████║   ██║   ╚██████╔╝██║  ██║███████╗███████║╚██████╔╝███████╗
╚═╝      ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝ ╚══▀▀═╝ ╚══════╝
                                                                                    
=======================================================";
sudo apt-get install postgresql postgresql-common libpq-dev pgadmin3
psql --version
sudo gem install --http-proxy http://192.168.1.17:8080 pg -V
#sudo su - postgres
#psql -U postgres
#ALTER USER Postgres WITH PASSWORD 'bmons';
#create role bmons with createdb login password 'bmons';
#create database bmons;
#create database bmons_test;
#create database bmons_development;
#create database bmons_production;

