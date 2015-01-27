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
#sudo apt-get install git git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

#sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
#gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#curl -L https://get.rvm.io | bash -s stable
#source ~/.rvm/scripts/rvm
#echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
#rvm install 2.1.5
#rvm use 2.1.5 --default
#ruby -v

#echo "gem: --no-ri --no-rdoc" > ~/.gemrc

#git config --global color.ui true
#git config --global user.name "Etiene Dalcol"
#git config --global user.email "dalcol@etiene.net"

#sudo add-apt-repository ppa:chris-lea/node.js
#sudo apt-get install nodejs
#wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz
#tar -xzvf ruby-2.1.5.tar.gz
#cd ruby-2.1.5/
#./configure
#make
#sudo make install
#ruby -v
#cd ../
#rm ruby-2.1.5.tar.gz
#rm -r ruby-2.1.5

#export PATH=$PATH:/home/bmons/.gem/ruby/1.8/bin
#export PATH=$PATH:/usr/lib/ruby/gems/1.8/bin
#sudo gem install rails

#rails -v

echo "=======================================================

██████╗  ██████╗ ███████╗████████╗ ██████╗ ██████╗ ███████╗███████╗ ██████╗ ██╗     
██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔════╝ ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║     
██████╔╝██║   ██║███████╗   ██║   ██║  ███╗██████╔╝█████╗  ███████╗██║   ██║██║     
██╔═══╝ ██║   ██║╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  ╚════██║██║▄▄ ██║██║     
██║     ╚██████╔╝███████║   ██║   ╚██████╔╝██║  ██║███████╗███████║╚██████╔╝███████╗
╚═╝      ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝ ╚══▀▀═╝ ╚══════╝
                                                                                    
=======================================================";
#sudo apt-get update
#sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
#wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
#sudo apt-get install postgresql-common
#sudo apt-get install postgresql-9.3 libpq-dev
sudo apt-get install postgresql postgresql-contrib phppgadmin
sudo ln -s /usr/share/phppgadmin /var/www/html/pgadmin

sudo su - postgres
createdb bmons
#ALTER USER Postgres WITH PASSWORD 'bmons';
rm /usr/share/phppgadmin/conf/config.inc.php
cp -a files/config.inc.php /usr/share/phppgadmin/conf/config.inc.php
sudo service apache2 restart
sudo /etc/init.d/postgresql restart