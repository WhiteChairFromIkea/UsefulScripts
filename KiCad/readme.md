# What does this scrip to

1. Script automatically search and picks latest installer name from https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=windows/nightly/
2. Checks if there already exist exe with the same name in working directory, aks confirmation, retries download if unfinished;
3. Runs KiCad installer in silent mode afterwards.

# KiCad nightly autoupdater script usage
1. msys2 os similar linux subsystem must be installed and accessible via cmd);
2. Create shortcut to cmd file on your desktop; 
3. Pass folder path where to save `kicad-installer.exe` files at the "Start in:" field of the shortcut:    
![Link example](https://user-images.githubusercontent.com/46539653/165174827-eb628726-dfbc-4527-9ee2-95a479d50226.png);
