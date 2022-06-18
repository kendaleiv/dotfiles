@echo off

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install -y                       ^
googlechrome                           ^
7zip.commandline                       ^
7zip.install                           ^
azure-data-studio                      ^
dotpeek                                ^
filezilla                              ^
firefox                                ^
graphviz                               ^
git.install                            ^
git-lfs                                ^
grepwin                                ^
inkscape                               ^
kdiff3                                 ^
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
winmerge                               ^
winscp                                 ^
wireshark                              ^

choco install -y vscode --params "/NoDesktopIcon"
choco install -y sql-server-management-studio

choco install -y ruby --version=2.7.6.1
choco pin add --name=ruby
choco pin add --name=ruby.install
choco install -y msys2

choco install -y spotify
choco pin add --name=spotify
