#!/bin/bash

# Prompt the user to enter a file name with the correct program extension
echo "Enter your file name."
read filename

# Check if the filename is valid (contains only letters, numbers, underscores, and dots)
if [[ ! $filename =~ ^[0-9a-zA-Z_.-]+$ ]]

then
  echo "Invalid filename! Please enter a valid filename within this ranges (a-z, A-Z, 0-9, _, ., -)"
  exit 1
fi

# Prompt the user to select a programming language
echo "Please select a programming language:"
echo "1. Python"
echo "2. Bash"
echo "3. C"
echo -e "4. JavaScript"
read -p "Enter your choice >> 1, 2, 3 or 4: " choice

# Generate the appropriate file template based on the user's choice
if [ "$choice" -eq 1 ]
then
  echo "#!/usr/bin/env python3" > ${filename}
  chmod +x ${filename}
  vi ${filename}
elif [ "$choice" -eq 2 ]
then
  echo "#!/bin/env bash" > ${filename}
  chmod +x ${filename}
  vi ${filename}
elif [ "$choice" -eq 3 ]
then
	echo -e "#include <stdio.h>\n#include \"main.h\"\n\nint main(void)\n{\n\n\treturn (0);\n}" > ${filename}
  vi ${filename}
elif [ "$choice" -eq 4 ]
then
  echo "#!/usr/bin/env node" > ${filename}
  vi ${filename}
else
  echo "Invalid choice. File creation cancelled."
fi

# #!/bin/bash
# # script that creates a file according to language, make it executable,
# # insert the correct file interpreter and keep it open in vim

# # Define an array of valid programming languages and their corresponding file extensions
# declare -A langs=(
#     [Python]="py"
#     [Bash]="sh"
#     [C]="c"
#     [JavaScript]="js"
# )

# echo "Hey! do yo want to create a file? Enter your file name WITHOUT a file extension."
# read filename

# # Check if the filename is valid (contains only letters, numbers, underscores)
# if [[ ! $filename =~ ^[a-zA-Z0-9_]+$ ]]
# then
#     echo -e "Invalid file name!\nPlease enter a name containing only letters, numbers,
#      underscores. Do NOT include file extensions like .c, .py, .sh etc."
#     exit 1
# fi

# # Prompt the user to select a programming language
# echo "Please select a programming language:"
# i=1
# for lang in "${!langs[@]}"; do
#     echo "$i. $lang"
#     i=$((i+1))
# done
# read -p "Enter your choice: " choice

# # Check if the user's choice is valid
# if [[ ! $choice =~ ^[1-${#langs[@]}]$ ]]
# then
#     echo "Invalid choice. File creation cancelled."
#     exit 1
# fi

# # Get the file extension for the selected programming language
# extension="${langs[$(echo ${!langs[@]} | cut -d ' ' -f $choice)]}"

# # Add the extension to the filename
# filename="$filename.$extension"

# # Generate the appropriate file template based on the user's choice
# if [ "$choice" -eq 1 ]
# then
#     echo "#!/usr/bin/python3" > ${filename}
#     chmod +x ${filename}
#     vi ${filename}
# elif [ "$choice" -eq 2 ]
# then
#     echo "#!/bin/bash" > ${filename}
#     chmod +x ${filename}
#     vi ${filename}
# elif [ "$choice" -eq 3 ]
# then
#     echo "#include <stdio.h>" > ${filename}
#     vi ${filename}
# elif [ "$choice" -eq 4 ]
# then
#     echo "#!/usr/bin/node" > ${filename}
#     vi ${filename}
# fi
