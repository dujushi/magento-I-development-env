#install lamp
sudo apt-get install apache2 -y
sudo apt-get install php5 php5-curl php5-gd php5-imagick php5-imap php5-mcrypt php5-mysql -y
sudo apt-get install php-pear php5-memcache -y
sudo apt-get install libapache2-mod-php5 -y
sudo a2enmod rewrite
sudo php5enmod mcrypt
sudo sed -i 's/www-data/vagrant/' /etc/apache2/envvars
echo 'mysql-server-5.5 mysql-server/root_password password 123456' | sudo debconf-set-selections
echo 'mysql-server-5.5 mysql-server/root_password_again password 123456' | sudo debconf-set-selections
sudo apt-get install mysql-server mysql-client -y

#set up mysql
mysql -uroot -p123456 -e'create database mage;'
mysql -uroot -p123456 mage < /vagrant/magento_sample_data.sql
mysql -uroot -p123456 <<QUERY
grant all privileges on mage.* to 'mage'@'localhost' identified by '123456';
QUERY

#create site folder
cp -R /vagrant/magento /vagrant/mage
sudo ln -fs /vagrant/mage /var/www/mage
sudo chown -R vagrant:vagrant /var/www/mage

#enable virtual host
cd /etc/apache2/sites-available/
sudo cp /vagrant/mage.local.conf .
sudo a2ensite mage.local.conf

#restart apache2
sudo service apache2 restart
