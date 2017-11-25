@echo off

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install -y                       ^
googlechrome                           ^
7zip.commandline                       ^
7zip.install                           ^
audacity                               ^
cmder                                  ^
cutepdf                                ^
docker-for-windows                     ^
dotpeek                                ^
fiddler4                               ^
filezilla                              ^
firefox                                ^
git.install                            ^
grepwin                                ^
inkscape                               ^
kdiff3                                 ^
linqpad4                               ^
lockhunter                             ^
nodejs                                 ^
notepadplusplus                        ^
nuget.commandline                      ^
nugetpackageexplorer                   ^
paint.net                              ^
papercut                               ^
postman                                ^
procexp                                ^
putty                                  ^
python                                 ^
quicktime                              ^
ruby                                   ^
screentogif                            ^
skype                                  ^
slack                                  ^
sysinternals                           ^
vim                                    ^
visualstudiocode                       ^
vlc                                    ^
wcat                                   ^
windirstat                             ^
winmerge                               ^
winscp                                 ^
wireshark                              ^
sql-server-management-studio           ^

choco pin add --name=docker-for-windows
choco pin add --name=googlechrome
choco pin add --name=slack

choco install -y spotify
choco pin add --name=spotify
