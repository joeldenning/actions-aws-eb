#!/bin/sh -l

# the user/group info may mismatch between container and host, and it
# may cause git to complain with `detected dubious ownership in repository`.
# mark everything as safe here as we don't know where the repository is (it
# might be something other than $GITHUB_WORKSPACE)
# see https://github.com/actions/runner-images/issues/6775
# see https://github.com/crytic/slither-action/pull/50/files
git config --global --add safe.directory '*'

command="eb $1"

$command
