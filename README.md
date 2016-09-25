#El Capitan setup guide

This is my personal setup guide for a fresh new install of Mac OS X: El Capitan. It's a bunch of software and apps what I use everyday. It's useful for me, and maybe for anyone else.

## Preparing

First installing iterm2 and homebrew.

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
    brew cask install sequel-pro
    brew cask install livereload
    
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
    
Utils:

    brew install mc
    brew install htop
    brew install phantomjs
  
Oh My ZSH: 
   
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    
### Mysql

v. 5.7.+

    brew install mysql
    unset TMPDIR
    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
    cp /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

v. 5.6.+

    brew install homebrew/versions/mysql56
    unset TMPDIR
    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql56)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
    cp /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist
  
    
Change root password (optional):
   
    mysqladmin -u root -p password "new_password"
    
### NGINX

    brew install nginx
    # 80 port
    sudo cp /usr/local/opt/nginx/*.plist /Library/LaunchDaemons
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

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

Autostart setup:
   
    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/opt/php55/homebrew.mxcl.php55.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php55.plist

Test: 

    lsof -Pni4 | grep LISTEN | grep php
    
### Perlbrew

    \curl -L http://install.perlbrew.pl | bash
    
    perlbrew init
    
    # get list of all available versions
    perlbrew available
    
    # install latest
    perlbrew install 5.2x.xx
    
    # change current perl
    perlbrew switch 5.2x.xx
 

*IMPORTANT*:  File::Util has a fatal bug in perl version 5.23+

https://rt.cpan.org/Public/Bug/Display.html?id=106771


## Configurations 

Appends aliases and some config strings to `.zshrc`:

    echo "$(curl -fsSL https://raw.githubusercontent.com/ncuxomozg/el_capitan_setup_guide/master/includes/aliases.conf)" >> ~/.zshrc

### tmux

    tmux source-file ~/.tmux.conf
   

Guide updating constantly.
