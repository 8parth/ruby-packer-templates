sleep 30

# name="ubuntu"
# email="change@me.com"
HOME="/home/ubuntu"
echo "NAME: $NAME"
echo "EMAIL: $EMAIL"
echo "RUBY VERSION: $RUBY_VERSION"
sudo apt-get update -y
# sudo apt-get upgrade -y

# install base packages
sudo apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential libpq-dev zlib1g-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libyaml-dev curl libxml2 libxslt1-dev

# add some repositories that have more up-to-date packages
sudo add-apt-repository ppa:nginx/stable
sudo add-apt-repository ppa:git-core/ppa

# update
sudo apt-get update -y

# install nginx, git, and nodejs
sudo apt-get install -y nginx git-core

cd $HOME
echo 'export RBENV_ROOT="$HOME/.rbenv"' >> ~/.bashrc
export RBENV_ROOT="$HOME/.rbenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo "Installed Rbenv"

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
echo "Installed Ruby Build"

# configure git
git config --global color.ui true
git config --global user.name $NAME
git config --global user.email $EMAIL

# create ssh keys for git deploys
ssh-keygen -t rsa -C $EMAIL -N "" -f "id_rsa"

# install the latest ruby version
$HOME/.rbenv/bin/rbenv install $RUBY_VERSION

# set the latest ruby version globally
$HOME/.rbenv/bin/rbenv global $RUBY_VERSION

# set gems to not install any documentation
echo "gem: --no-ri --no-rdoc" > $HOME/.gemrc

eval "$($HOME/.rbenv/bin/rbenv init -)"
# install bundler
gem install bundler --pre
