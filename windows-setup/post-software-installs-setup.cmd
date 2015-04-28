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
echo ## npm installs
echo.

call npm install -g bower
call npm install -g grunt-cli
call npm install -g gulp
call npm install -g yo

echo.
echo ## Generate SSH key
echo.

call mkdir "C:%HOMEPATH%\.ssh"
call ssh-keygen -f "C:%HOMEPATH%\.ssh\id_rsa" -t rsa -N ""

echo.
echo ## Windows updates
echo.

wuauclt /detectnow
