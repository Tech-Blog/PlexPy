#install git if not installd
git --version 2>&1 >/dev/null # improvement by tripleee
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 1 ]; then
apt-get install git;
fi
#Move to /opt
cd /opt
#clone plexpy from git
git clone https://github.com/drzoidberg33/plexpy.git /opt/plexpy
#add user
adduser --system --group --disabled-login plexpy --home /opt/plexpy --shell /bin/nologin --quiet
sudo chown -R plexpy:plexpy /opt/plexpy
#create default setting file
wget https://raw.githubusercontent.com/Tech-Blog/PlexPy/master/plexpy-settings -O /etc/default/plexpy
sudo cp /opt/plexpy/init-scripts/init.ubuntu /etc/init.d/plexpy
sudo chmod +x /etc/init.d/plexpy
sudo update-rc.d plexpy defaults
sudo service plexpy start
sudo update-rc.d plexpy defaults 98
echo "PlexPy will be running on its default port 8181 unless you changed the HP_PORT value in /etc/default/plexpy"
