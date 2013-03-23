user=eric
name="Eric Wright"
email="dev@ericwright.me"
release=lisa
#sudo sh -c 'echo "deb http://deb.opera.com/opera $release non-free" >> /etc/apt/sources.list'

sudo apt-get update
sudo apt-get upgrade

sudo apt-get -y install zsh htop zip unzip vim cowsay adobe-flashplugin screen wget curl git build-essential man openjdk-6-jre-headless openjdk-6-jre chromium-browser vlc libssl-dev postgresql postgresql-server-dev-all postgresql-contrib libpq-dev libreadline6-dev libxml2 libxml2-dev libxslt1-dev

cd /tmp
wget -O sublime_text_2.tar.bz2 http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202%20Build%202181%20x64.tar.bz2

cd /opt
sudo tar -jxvf /tmp/sublime_text_2.tar.bz2
sudo ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime


cd /home/$user
su $user -c 'curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh'

sudo -u $user echo alias railroad="bundle exec rails s" >> /home/$user/.zshrc
sudo -u $user echo alias be="bundle exec" >> /home/$user/.zshrc



# RVM
curl -L get.rvm.io | bash -s stable
echo -e "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri" > /etc/gemrc

# Rename home directories to lowercase.
cd /home/$user
mv Pictures pictures
mv Music music
mv Videos videos
mv Documents documents
mv Desktop desktop
mv Downloads downloads
mv Projects projects

# SSH
su $user -c 'yes | ssh-keygen -t rsa'
sudo -u $user ssh-keygen -t rsa -C $HOST -f id_rsa -P ''

# Git
git config --global user.name "$name"
git config --global user.email "$email"

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global help.autocorrect 5
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

git config --global color.ui auto

# Dropbox
cd /tmp
cd ~ && wget -O - "http://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

## WIP
git clone git://gist.github.com/2371581.git
mv 2371581/dropbox /etc/init.d/

sudo chmod +x /etc/init.d/dropbox
sudo update-rc.d dropbox defaults

# Vim
echo '4' | sudo update-alternatives --config editor


# Postgres
sudo -u postgres createuser --superuser $user
sudo -u postgres createdb eric
