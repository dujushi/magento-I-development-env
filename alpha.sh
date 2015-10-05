#set up mysql
mysql -uroot -p123456 -e'create database alpha;'
mysql -uroot -p123456 alpha < /vagrant/magento_sample_data.sql
mysql -uroot -p123456 <<QUERY
grant all privileges on alpha.* to 'alpha'@'localhost' identified by '123456';
QUERY

#create site folder
cp -R /vagrant/magento /vagrant/alpha
sudo ln -fs /vagrant/alpha /var/www/alpha
sudo chown -R vagrant:vagrant /var/www/alpha

#enable virtual host
cd /etc/apache2/sites-available/
sudo cp /vagrant/mage.local.conf alpha.local.conf
sudo sed -i 's/mage/alpha/' alpha.local.conf 
sudo a2ensite alpha.local.conf

#restart apache2
sudo service apache2 restart
