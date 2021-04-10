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
echo ## Ruby
echo.

call ridk install 2 3
call gem install jekyll

echo.
echo ## npm installs
echo.

call npm install --global --production windows-build-tools
call npm config set python C:\tools\python2
call npm install -g node-gyp
