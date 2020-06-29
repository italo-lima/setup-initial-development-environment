echo "INSTALLING GOOGLE CHROME"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
sudo apt install -f

echo "INSTALLING BASIC PACKAGES"
sudo apt install git fish fonts-firacode openjdk-8-jdk apt-transport-https ca-certificates gnupg

echo "SET FISH AS DEFAULT SHELL"
chsh -s `which fish`

echo "CONFIGURING GIT"
git config --global user.name "italo-lima"
git config --global user.email "italojonas@hotmail.com"
git config --global credential.helper "cache --timeout=86400"

echo "INSTALLING YARN"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

echo "Install Insomnia"
sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install insomnia

echo "INSTALL LIVE-SERVER"
sudo yarn global add live-server

echo "INSTALL CREATE REACT APP"
sudo yarn global add create-react-app

echo "INSTALL FIREBASE TOOLS"
sudo yarn global add firebase-tools

echo "INSTALL DOCKER"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

echo "INSTALL DOCKER COMPOSE"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "INSTALLING OH MY FISH"
fish -c "curl -L https://get.oh-my.fish | fish"

echo "INSTALLING FISH THEME"
fish -c "omf install spacefish"

echo "INSTALLING NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fish -c "omf install nvm"

echo "INSTALLING VSCODE"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

echo "INCREASE WATCHER LIMIT"
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "INSTALLING VSCODE EXTENSIONS"

echo "----- Highlight Matching Tag"
code --install-extension vincaslt.highlight-matching-tag

echo "----- Auto Complete Tag"
code --install-extension formulahendry.auto-complete-tag

echo "----- Color Highlight"
code --install-extension naumovs.color-highlight

echo "----- Prettier - Code formatter"
code --install-extension esbenp.prettier-vscode

echo "----- ESLint"
code --install-extension dbaeumer.vscode-eslint

echo "----- Bracket Pair Colorizer"
code --install-extension CoenraadS.bracket-pair-colorizer

echo "----- Material Icon Theme"
code --install-extension PKief.material-icon-theme

echo "----- Dracula"
code --install-extension dracula-theme.theme-dracula

echo "----- EditorConfig"
code --install-extension EditorConfig.EditorConfig
