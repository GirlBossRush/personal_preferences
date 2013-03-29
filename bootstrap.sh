sudo apt-get update
sudo apt-get upgrade

sudo apt-get -y install zsh htop zip unzip vim cowsay tmux wget curl git build-essential man
sudo apt-get -y libssl-dev postgresql postgresql-server-dev-all postgresql-contrib libpq-dev libreadline6-dev libxml2 libxml2-dev libxslt1-dev

cd /home/eric
chsh -s /usr/bin/zsh eric
su eric -c 'curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh'

# RVM
curl -L get.rvm.io | bash -s stable
echo -e "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri" > /etc/gemrc
echo -e "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri" > /

# SSH
su eric -c 'yes | ssh-keygen -t rsa'
sudo -u eric ssh-keygen -t rsa -C $HOST -f id_rsa -P ''

# Git
git config --global user.name "Eric Wright"
git config --global user.email "dev@ericwright.me"

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global help.autocorrect 10
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

git config --global color.ui auto

# Dropbox
#cd /tmp
#cd ~ && wget -O - "http://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
#
### WIP
#git clone git://gist.github.com/2371581.git
#mv 2371581/dropbox /etc/init.d/
#
#sudo chmod +x /etc/init.d/dropbox
#sudo update-rc.d dropbox defaults

# Vim
echo '4' | sudo update-alternatives --config editor


# Postgres
sudo -u postgres createuser --superuser eric
sudo -u postgres createdb eric
