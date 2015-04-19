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

echo.
echo ## RubyGems
echo.

:: Using 2.0.3, see https://github.com/oneclick/rubyinstaller/issues/184#issuecomment-21310329
:: The main objective is Jekyll works with the installed Chocolatey packages.
call gem update --system 2.0.3

call gem install bundler
call gem install jekyll

echo.
echo ## npm installs
echo.

npm install -g bower
npm install -g grunt-cli
npm install -g gulp
npm install -g yo

echo.
echo ## Generate SSH key
echo.

call ssh-keygen -f "id_rsa" -t rsa -N ""

call mkdir "C:%HOMEPATH%\.ssh"
call move "id_rsa" "C:%HOMEPATH%\.ssh\"
call move "id_rsa.pub" "C:%HOMEPATH%\.ssh\"

echo.
echo ## Windows updates
echo.

wuauclt /detectnow
