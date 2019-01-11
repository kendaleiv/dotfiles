@echo off

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install -y                       ^
googlechrome                           ^
googlechrome-zenhub                    ^
7zip.commandline                       ^
7zip.install                           ^
audacity                               ^
azure-data-studio                      ^
cutepdf                                ^
docker-desktop                         ^
dotpeek                                ^
fiddler                                ^
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
slack                                  ^
sysinternals                           ^
vim                                    ^
vlc                                    ^
wcat                                   ^
windirstat                             ^
winscp                                 ^
wireshark                              ^

choco install vscode --params "/NoDesktopIcon"
choco install msys2 --params "/NoUpdate"
choco install sql-server-management-studio

choco pin add --name=docker-desktop
choco pin add --name=googlechrome
choco pin add --name=slack

choco install -y spotify
choco pin add --name=spotify
