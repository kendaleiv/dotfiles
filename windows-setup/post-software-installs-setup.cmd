@echo off

echo.
echo ## Set-ExecutionPolicy RemoteSigned -Force
echo.

@powershell -Command "Set-ExecutionPolicy RemoteSigned -Force"

echo.
echo ## PowerShell aliases
echo.

@powershell -Command "Add-Content $profile 'New-Alias g git'"

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
echo ## Install / configure node-gyp (assumes python2 is installed at the Chocolatey package default location)
echo ##
echo ## Easy test if it's working: npm install -g bcrypt
echo ##
echo ## This may be broken, if nothing else it's a good starting point to work from.
echo ## See https://github.com/nodejs/node-gyp#installation if this doesn't work.
echo ##
echo ## This doesn't include
echo ## "For 64-bit builds of node and native modules you will also need the Windows 7 64-bit SDK" from https://github.com/nodejs/node-gyp#installation
echo.

set GYP_MSVS_VERSION "2015"
setx GYP_MSVS_VERSION "2015"

call npm config set python C:\tools\python2\python.exe

call npm install -g node-gyp

echo.
echo ## npm installs
echo.

call npm install -g ^
eslint              ^
grunt-cli           ^
gulp-cli            ^
http-server         ^
karma-cli           ^
protractor          ^
rimraf              ^
typescript          ^
tslint              ^
typings             ^
webpack             ^
webpack-dev-server  ^
yo                  ^

echo.
echo ## Generate SSH key
echo.

call mkdir "C:%HOMEPATH%\.ssh"
call ssh-keygen -f "C:%HOMEPATH%\.ssh\id_rsa" -t rsa -N ""
