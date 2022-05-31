#!/bin/sh

FILE=$(curl --silent 'https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=windows/nightly/' | egrep -o 'kicad-nightly-[a-zA-Z0-9._\-]*x86_64-lite.exe' | tail -1)

# Check curl success
if [ -z "$FILE" ];	then 
	{
		printf "curl fail, terminate\n";
		exit 1;
	}
fi

printf "Latest installer available to download: $FILE \n"

if test -f "$FILE";
	then 
	{		
		
		printf "\n\"$FILE\" is already downloaded.\n"
		
		while true; do
			read -p "Do you wish to download and install again? [Y(es) / N(o)]" yn
			case $yn in
				[Yy]* )
				# continue
				break
				;;
				[Nn]* )
				exit 1
				;;
				* )
				echo "Please answer yes or no.";;
			esac
		done
	}
fi

#/n
echo
# download installer
curl -L -o $FILE -C - https://kicad-downloads.s3.cern.ch/windows/nightly/$FILE

# check curl error
res=$?
if test "$res" != "0";
	then
	{
		
		if test "$res" == "33";
			then
			{
				printf "Cannot resume, but file downloaded is probably OK..\n"
			}
			
			else
			{		
				printf "Error: curl failed with: $res, terminate\n"
				read -p "Press enter to exit"
				exit 1;
			}
		fi
	}
fi

# Not working in silent mode :/
	# start "" "$FILE /S" /B
# So using this workaround:
cat > "last_installer_cmd.cmd" << EOF
	@ECHO OFF
	ECHO Installing Kicad...
	@ECHO ON
	${FILE} /S
	:: pause
	exit
EOF

start "" "last_installer_cmd.cmd" /B

# read -p "Press enter to exit"
