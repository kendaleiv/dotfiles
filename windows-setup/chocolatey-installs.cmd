@echo off

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install -y                       ^
google-chrome-x64                      ^
keepass.install                        ^
spotify                                ^
7zip.commandline                       ^
7zip.install                           ^
atom                                   ^
audacity                               ^
cmder                                  ^
cutepdf                                ^
dotpeek                                ^
fiddler4                               ^
filezilla                              ^
firefox                                ^
git.install                            ^
greenshot                              ^
grepwin                                ^
kdiff3                                 ^
linqpad4                               ^
lockhunter                             ^
nodejs.install                         ^
notepadplusplus                        ^
nuget.commandline                      ^
nugetpackageexplorer                   ^
paint.net                              ^
papercut                               ^
procexp                                ^
putty                                  ^
python                                 ^
python2                                ^
ruby                                   ^
ruby2.devkit                           ^
screenhero                             ^
screentogif                            ^
skype                                  ^
slack                                  ^
sysinternals                           ^
visualstudiocode                       ^
vlc                                    ^
wcat                                   ^
windirstat                             ^
winmerge                               ^
winscp                                 ^
wireshark                              ^
