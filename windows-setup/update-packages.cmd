@echo off

echo.
echo ## Chocolatey packages
echo.

call choco upgrade all -y

echo.
echo ## Atom packages
echo.

call apm upgrade --no-confirm

echo.
echo ## npm packages
echo.

call npm update -g

echo.
echo ## RubyGems
echo.

call gem update
