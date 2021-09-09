exit 1;

# write all 'kicad-msvc[a-zA-Z0-9._\-]*x86_64-lite.exe' filelisting to list.txt:
curl 'https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=windows/nightly/' | egrep -o 'kicad-msvc[a-zA-Z0-9._\-]*x86_64-lite.exe' > list.txt

# Extract only only last line from list.txt:
egrep -o 'kicad-msvc[a-zA-Z0-9._\-]*x86_64-lite.exe' list.txt | tail -1

# The same as previous, but from URL
curl 'https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=windows/nightly/' | egrep -o 'kicad-msvc[a-zA-Z0-9._\-]*x86_64-lite.exe' | tail -1

# Fresh filename:
FILENAME=$(curl 'https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=windows/nightly/' | egrep -o 'kicad-msvc[a-zA-Z0-9._\-]*x86_64-lite.exe' | tail -1)

-------------
# Check if installer already exist:
FILE=curl 'https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=windows/nightly/' | egrep -o 'kicad-msvc[a-zA-Z0-9._\-]*x86_64-lite.exe' | tail -1

if test -f "$FILE"; then
    echo "$FILE exists."
fi
--------------

Check if variable is null:
if [ -z "$var" ]; then echo "NULL"; else echo "Not NULL"; fi
--------------

#Check result of bash command"
#!/bin/sh
curl http://example.com
res=$?
if test "$res" != "0"; then
   echo "the curl command failed with: $res"
fi