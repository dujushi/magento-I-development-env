#set up mysql
mysql -uroot -p123456 -e'drop database mage; create database mage;'
mysql -uroot -p123456 mage < /vagrant/magento_sample_data.sql

#create site folder
sudo rm -rf /vagrant/mage
sudo rm -rf /var/www/mage
sudo cp -R /vagrant/magento /vagrant/mage
sudo ln -fs /vagrant/mage /var/www/mage
sudo chown -R vagrant:vagrant /var/www/mage
