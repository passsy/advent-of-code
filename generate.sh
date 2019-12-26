#!/bin/bash

set -e

DAY=$1
echo "Creating project day$DAY"

if [ -z "$DAY" ]; then
  echo "no day argument given"
  exit 1
fi

cookiecutter --no-input day-template day=$DAY

# Add new module to IntelliJ
NEW_MODULE="<module fileurl=\"file:\/\/\$PROJECT_DIR$\/day$DAY\/day$DAY.iml\" filepath=\"\$PROJECT_DIR\$\/day$DAY\/day$DAY.iml\" \/>"
MODULE_END_TAG="<\/modules>"
sed -i -e "s/$MODULE_END_TAG/$NEW_MODULE$MODULE_END_TAG/g" .idea/modules.xml

cd day$DAY
pub get