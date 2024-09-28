#!/bin/bash
# Creates a file, makes it executable, and opens it up in vim editor

# Check if a filename was provided as an argument
if [ -z "$1" ]; then
	echo "Please provide a file name."
	read -r fileName
else
	fileName="$1"
fi
	echo -e "#!/bin/bash\n" > "${fileName}"
	chmod +x "${fileName}"
	vim +2 "${fileName}"

