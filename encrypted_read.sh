#!/bin/bash
set -e

readonly TEMP_FILE=/tmp/gpg_out.txt

if [ -z "$1" ]; then
    echo 'Usage ./encrypted_read.sh <file>'
    exit 1
fi
encrypted_file="$1"

if [[ "$encrypted_file" != *".gpg" ]] ; then
    echo 'The selected file does not appear to be encrypted. Just use less.'
    exit 1
fi

read -s -p 'Enter passphrase: ' gpg_key

# Decrypt
echo 'Decrypting...'
echo "$gpg_key" | gpg --batch --yes --passphrase-fd 0 -o "$TEMP_FILE" -d "$encrypted_file" 

# Read
echo 'Opening in reader...'
less "$TEMP_FILE"

# Clean
echo 'Shredding decrypted buffer...'
shred -n 3 "$TEMP_FILE"
rm "$TEMP_FILE"

echo 'Done.'

