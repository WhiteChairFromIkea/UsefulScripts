:: Update SVN or GIT in subfolders, one level deep

:: Uncomment for SVN:
:: FOR /D %%A IN (*) DO svn update %%A

:: Uncomment for GIT:
FOR /D %%A IN (*) DO git -C "%%A" pull

::pause
