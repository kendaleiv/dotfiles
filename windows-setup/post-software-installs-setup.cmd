@echo off

echo.
echo ## Set HOME user environment variable
echo.

set HOME "C:%HOMEPATH%"
setx HOME "C:%HOMEPATH%"

echo.
echo ## Copy dotfiles
echo.

copy "..\.gitconfig" "C:%HOMEPATH%\.gitconfig"
copy "..\.gemrc" "C:%HOMEPATH%\.gemrc"

echo.
echo ## Copy update-packages.cmd
echo.

copy "update-packages.cmd" "C:%HOMEPATH%\update-packages.cmd"

echo.
echo ## Ruby
echo.

:: This isn't the best way to fix the SSL issue.
:: It's not secure and requires interactively confirming adding an insecure source.
:: But, it's convenient...
:: http://stackoverflow.com/a/27447105
call gem sources -r https://rubygems.org/
call gem sources -a http://rubygems.org/
call gem update --system
call gem sources -r http://rubygems.org/
call gem sources -a https://rubygems.org/

call gem install bundler
call gem install jekyll
call gem install travis

echo.
echo ## npm installs
echo.

call npm install --global --production windows-build-tools
call npm config set python C:\tools\python2
call npm install -g node-gyp

call npm install -g ^
http-server         ^
rimraf              ^
yo                  ^

echo.
echo ## Visual Studio Code
echo.

call code --install-extension EditorConfig.EditorConfig

echo.
echo ## Generate SSH key
echo.

call mkdir "C:%HOMEPATH%\.ssh"
call ssh-keygen -f "C:%HOMEPATH%\.ssh\id_rsa" -t rsa -N ""
