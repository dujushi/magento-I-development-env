# Magento I Dev Env Setup with Vagrant
This repo is built to help set up a simple Magento I LAMP development environment on Mac OS X. The env is set up with Vagrant and Virtualbox based on the most popular Ubuntu Vagrant image. The provision file is written in shell.

# How to
## Step 0
Install Vagrant and Virtualbox

## Step 1
```
git clone git@github.com:dujushi/magento-I-development-env.git mages
```

## Step 2
```
cd mages
```
Download the latest magento 1 code

Download the latest sample data

mv the sample sql file to mages/magento_sample_data.sql

merge media/skin sample data with magento code into mages/magento

Until now you should have the following files and folders under mages directory:
```
README.md       lamp.sh         mage.local.conf     magento_sample_data.sql
Vagrantfile     magento 
```

## Step 3
```
vagrant up
sudo vim /etc/hosts
192.168.33.10 mage.local
```
Now you can visit mage.local on your browser to set up the site.

## What you get
1. MySQL:
 
    * Database name: mage
    * User/Password: mage/123456

2. Magento:

    /var/www/mage on the server is mapped to mages/mage on our local machine. You can modify the code directly with any IDE.

3. SSH:

    Run 'vagrant ssh' to access the server
