@echo off

:: Install Chocolatey first

:: These packages are in a seperate file because they require
:: intervention to complete installation.

choco install -y ^
docker           ^
pdfsam.install   ^
pnggauntlet      ^
