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
echo ## npm installs
echo.

call npm install -g ^
bower               ^
grunt-cli           ^
gulp                ^
yo                  ^

echo.
echo ## Generate SSH key
echo.

call mkdir "C:%HOMEPATH%\.ssh"
call ssh-keygen -f "C:%HOMEPATH%\.ssh\id_rsa" -t rsa -N ""

echo.
echo ## Windows updates
echo.

wuauclt /detectnow
