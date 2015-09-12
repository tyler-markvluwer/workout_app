# Pre reqs
# 1. Must have homebrew installed
# 2. Must have xcode and xcode command line tools installed
# 3. ???
# 4. must have javac installed (built in for mac)
# 5. must have sublime package installer installed

# install node
brew update # okay if this fails
brew install node # don't use sudo on brew commands
npm install -g grunt-cli

# install npm
# donwload from nodejs site. This is the easiest way

# install cordova
sudo npm install -g cordova

# install ant
brew install ant

# install broccoli
sudo npm install -g broccoli
sudo npm install -g broccoli-cli
sudo npm install -g broccoli-coffee
sudo npm install # install all packages specific to this project

# make right directories and all
mkdir src
mkdir src/coffee
mkdir src/sass

mkdir public
touch public/index.html
touch public/style.css
touch src/coffee/index.coffee
touch src/sass/index.sass

# install the coffeescript syntax highlighter for sublime
# 1. cmd + shift + p
# 2. install, then press enter
# 3. search 'BetterCoffeeScript'
# 4. Press enter
