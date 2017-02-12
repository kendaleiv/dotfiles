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

call gem update --system
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
echo ## Generate SSH key
echo.

call mkdir "C:%HOMEPATH%\.ssh"
call ssh-keygen -f "C:%HOMEPATH%\.ssh\id_rsa" -t rsa -N ""
