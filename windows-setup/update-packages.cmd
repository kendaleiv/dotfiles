@echo off

echo.
echo ## Chocolatey packages
echo.

call choco upgrade all -y

echo.
echo ## Atom packages
echo.

call apm upgrade

echo.
echo ## npm packages
echo.

call npm update -g
