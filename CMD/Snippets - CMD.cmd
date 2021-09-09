@echo off
exit

:: 2021-07-01
:: ==> GET CURRENT PATH
:: Get current path and remove trailing slach if necessarry:
set curPath=%~dp0
echo curPath pries: %curPath%
:: Remove trailing slash from the path:
IF %curPath:~-1%==\ SET curPath=%curPath:~0,-1%
echo curPath po:    %curPath%

::=======================================================

:: ==> SVN UPDATE
:: Save this as svnupdate.cmd, updates subfolders:
FOR /D %%A IN (*) DO svn update %%A

:: ======================================================
