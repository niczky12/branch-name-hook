#!/usr/bin/env bash

echo "The hook is running"
echo "$@"


local_branch="$((git rev-parse --abbrev-ref HEAD) | tr -d '\n')"

valid_release_branch="^(main)|(master)$"
valid_dev_branch="^(?:[a-z]{3})-([A-Z0-9]+\-\d+)-([a-zA-Z0-9\-]+)$"

message="There is something wrong with your branch name. Branch names in this project must adhere to this contract: $valid_branch_regex. Your commit will be rejected. You should rename your branch to a valid name and try again."

if [[ $local_branch =~ valid_release_branch ]]
then
    echo "On main branch"
    exit 0
fi

if [[ ! $local_branch =~ $valid_branch_regex ]]
then
    echo "$message"
    exit 1
fi

exit 0