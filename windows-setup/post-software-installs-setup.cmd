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
echo ## cmder
echo.

copy "cmder\config\*.*" "C:\tools\cmder\config" /Y

echo.
echo ## Atom configuration
echo.

mkdir "C:%HOMEPATH%\.atom\"
copy "..\.atom\*.*" "C:%HOMEPATH%\.atom" /Y

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

:: If the jekyll gem fails to install due a Ruby DevKit issue,
:: fix it after this script runs manually.
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
bower               ^
eslint              ^
grunt-cli           ^
gulp                ^
http-server         ^
karma-cli           ^
protractor          ^
typescript          ^
tslint              ^
typings             ^
webpack             ^
webpack-dev-server  ^
yo                  ^

echo.
echo ## Atom packages
echo.

call apm install               ^
atom-beautify                  ^
atom-typescript                ^
editorconfig                   ^
linter                         ^
linter-eslint                  ^
linter-tslint                  ^
merge-conflicts                ^
pigments                       ^
sublime-style-column-selection ^

echo.
echo ## Generate SSH key
echo.

call mkdir "C:%HOMEPATH%\.ssh"
call ssh-keygen -f "C:%HOMEPATH%\.ssh\id_rsa" -t rsa -N ""
