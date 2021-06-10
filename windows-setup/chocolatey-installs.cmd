@echo off

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install -y                       ^
googlechrome                           ^
7zip.commandline                       ^
7zip.install                           ^
audacity                               ^
azure-data-studio                      ^
docker-desktop                         ^
dotpeek                                ^
filezilla                              ^
firefox                                ^
graphviz                               ^
git.install                            ^
git-lfs                                ^
grepwin                                ^
hugo-extended                          ^
inkscape                               ^
kdiff3                                 ^
linqpad4                               ^
lockhunter                             ^
microsoft-windows-terminal             ^
nodejs                                 ^
notepadplusplus                        ^
nuget.commandline                      ^
nugetpackageexplorer                   ^
obs-studio                             ^
paint.net                              ^
postman                                ^
procexp                                ^
putty                                  ^
python                                 ^
ruby                                   ^
screentogif                            ^
vlc                                    ^
windirstat                             ^
winscp                                 ^
wireshark                              ^

choco install -y vscode --params "/NoDesktopIcon"
choco install -y msys2 --params "/NoUpdate"
choco install -y sql-server-management-studio

choco install -y spotify
choco pin add --name=spotify
