#El Capitan setup guide

This is my personal setup guide for a fresh new install of Mac OS X: El Capitan. It's a bunch of software and apps what I am using everyday. It's useful for me, and maybe for anyone else.

Enjoy it! 

## Preparing

First install iterm2 and homebrew.

iTerm: 
https://www.iterm2.com/

Homebrew:

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
Test homebrew configuration and fix:
    
    brew update
    brew doctor

Now time to Cask package:

    brew install cask

## Software (app/cask)

Through cask: 

    # free software
    brew cask install google-chrome
    brew cask install google-drive
    brew cask install firefox
    brew cask install skype
    brew cask install slack
    brew cask install utorrent
    brew cask install virtualbox
    brew cask install vagrant
    
    # shareware 
    brew cask install alfred
    brew cask install teamviewer
    brew cask install tramsmit
    brew cask install keepassx

Apps from web:

flux.app: https://justgetflux.com/

alternote: https://itunes.apple.com/app/id974971992?mt=12

telegram: https://itunes.apple.com/ru/app/telegram/id747648890
    
## Coding

First install service controller for brew:

    brew tap homebrew/services
    
### Mysql
   
   
    brew install mysql
   
    unset TMPDIR

    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
    
    mysql.server start
    
Change root password (optional):
   
    mysqladmin -u root -p oldpassword newpass
    
### NGINX

    brew install nginx

Add config folder: 

    mkdir /usr/local/etc/nginx/conf.d/
    
Edit `nginx.conf`:

    http {
       ...
       include conf.d/*.conf;
    }

### PHP-FPM

    brew tap homebrew/dupes
    brew tap josegonzalez/homebrew-php
    brew install --without-apache --with-fpm --with-mysql php55
    


## Configurations 
