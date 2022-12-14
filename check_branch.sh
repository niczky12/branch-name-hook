#!/usr/bin/env bash
if [ "$#" -ne 2 ]; then
    echo "Exactly 2 arguments (regex and example) are required, $# provided"
    exit 1
fi

check_regex=$1
example=$2

local_branch="$(git rev-parse --abbrev-ref HEAD)"
valid_release_branch="^(main)|(master)"

# this is to make sure the example is sensible
if [[ ! $example =~ $check_regex ]]
then
    echo "Your example doesn't match the provided regex. Configure args correctly."
    exit 1
fi

if [[ $local_branch =~ $valid_release_branch ]]
then
    exit 0
fi

matchCount=`echo $local_branch | grep -Ec "$check_regex"`

if [[ matchCount -ne 1 ]]
then
    echo "Your branch must follow the pattern $check_regex, (i.e., $example)."
    exit 1
fi

exit 0