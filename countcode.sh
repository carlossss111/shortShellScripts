#!/bin/bash
# Daniel 2023
# Counts Lines of code (LOC) and puts them into CSVs per commit
readonly CSV_DIR="$1"

# Validation
dpkg -s cloc > /dev/null || exit 1
[[ -n "$CSV_DIR" ]] || { echo 'Usage: ./countcode.sh <dir/to/store/csvs>' ; exit 2; }
[[ -d "$CSV_DIR" ]] || { echo 'CSV dir does not exist!' ; exit 3; }
[[ -e '.git' ]] || { echo 'Not running from a git repository!' ; exit 4; }

# List commit SHAs in reverse order
SHA_str=`git log --pretty=format:"%H"`
SHA_str=`tac <<< "$SHA_str"`

# Loop through commit SHAs
original_branch=`git branch --no-color --show-current`
i=0
echo 'Writing to...'
while IFS='\n'  read -ra SHA_list; do
  for SHA in "${SHA_list[@]}"
  do
	cut_SHA=`echo "$SHA" | cut -c1-8`
	csv_name="$i-$cut_SHA.csv"
	git checkout $SHA --quiet
	cloc . --exclude-dir='venv' --exclude-lang='XML,JSON,HTML,Gradle,YAML,Dockerfile,ProGuard,DOS Batch,Bourne Shell,Markdown' \
	       --quiet --csv --out="$CSV_DIR/$csv_name"
	echo "$CSV_DIR/$csv_name"
	((i++))
  done
done <<< "$SHA_str"
git checkout "$original_branch"
echo 'Finished.'
exit 0
