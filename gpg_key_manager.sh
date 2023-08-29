#!/bin/bash

# Encrypting password file
# gpg -o safe_file.gpg -e passwords.txt

# Content of passwords.txt
# export USER="Clarence"
# export PASS="mypassword123"


# The /tmp/.$UID is a temporary placeholder for the decrypted file
# If file already exists, it will be removed.
if [ -f /tmp/.$UID ]; then
    rm /tmp/.$UID
fi

# Decrypt encrypted file safe_file.gpg that contains keys written like a variable
# Format of the file is export PASS=mypassword123
# File is encrypted using command below:
# gpg --output safe_file.gpg --encrypt --recipient subiaclarence96@gmail.com passwords.txt
gpg -o /tmp/.$UID -d -r subiaclarence96@gmail.com safe_file.gpg &>/dev/null

# Source the decrypted file so it can be exported as variable
source /tmp/.$UID
sleep 1

# Remove temporary file right after it has been sourced
rm /tmp/.$UID

echo $USER
echo $PASS

# your script comes here and can use exported variables above

# <script>
