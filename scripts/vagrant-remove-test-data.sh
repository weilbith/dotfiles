#!/bin/bash

# Unfortunately it is not possible to get this list from the directory structure
# at the base role. Because this script gets executed on the Vagrant machine,
# there is no access to the origin host file-system.
test_data_directories=("documents")

echo "Find and remove eventually copied test data..."

for directory in "${test_data_directories[@]}"; do
  directory_path="${HOME}/${directory}"

  if [[ -d "$directory_path" ]]; then
    rm -rf "$directory_path"
    echo "Removed ${directory}"
  fi
done

echo "Done"
