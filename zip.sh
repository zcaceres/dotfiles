#!/bin/bash
set -eo pipefail

cd ./dist && zip -r filename-here ./ && mv filename-here.zip ../
echo "DID YOU BUMP THE VERSION NUMBER IN THE MANIFEST.JSON?"
