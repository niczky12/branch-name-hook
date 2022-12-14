#!/usr/bin/env bash
if [ "$#" -ne 2 ]; then
    echo "Exactly 2 arguments (regex and example) are required, $# provided"
    exit 1
fi


valid_dev_branch=$1
example=$2


local_branch="$(git rev-parse --abbrev-ref HEAD)"
valid_release_branch="^(main)|(master)"
message="Your branch must follow the pattern $valid_dev_branch, (i.e., $example)."

echo $local_branch

if [[ $local_branch =~ $valid_release_branch ]]
then
echo "$message"
    exit 0
fi

if [[ ! $local_branch =~ $valid_dev_branch ]]
then
    echo "$message"
    exit 1
fi

exit 0