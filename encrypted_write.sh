#!/bin/bash
set -e

readonly TEMP_FILE=/tmp/gpg.out

if [ -z "$1" ]; then
    echo 'Usage: ./encrypted_write.sh <file> [-e] [editor (default=vim)]'
    exit 1
fi
encrypted_file="$1"

editor_cmd=vim
if [ "$2" == '-e' ]; then
    if [ -z "$3" ]; then
        echo '-e editor option specified but no editor supplied as the next argument'
        exit 1
    fi
    editor_cmd="$3"
    which "$editor_cmd" > /dev/null # will exit early on failure if editor is invalid
    echo "Editor = '$editor_cmd'"
fi

if [[ "$encrypted_file" != *".gpg" ]] ; then
    echo 'The selected file does not appear to be encrypted.'
    echo "Run 'gpg -o <name>.gpg -c <file> && shred -n 3 <file> && rm <file>' instead"
    exit 1
fi

read -s -p 'Enter passphrase: ' gpg_key

# Decrypt
echo 'Decrypting...'
echo "$gpg_key" | gpg --batch --yes --passphrase-fd 0 -o "$TEMP_FILE" -d "$encrypted_file" 

# Edit
echo 'Opening in editor...'
$editor_cmd "$TEMP_FILE"
echo -e "\nWritten $(wc -w $TEMP_FILE | awk '{print $1;}') words"

# (Re)encrypt and clean
echo "$gpg_key" | gpg --batch --yes --passphrase-fd 0 -o "$encrypted_file" -c "$TEMP_FILE" 
echo "Reencrypted as $encrypted_file."
echo 'Shredding decrypted buffer...'
shred -n 3 "$TEMP_FILE"
rm "$TEMP_FILE"

echo 'Done.'

