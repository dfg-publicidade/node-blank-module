#!/bin/bash

declare -a modules=(
    "node-app-module"

    "node-cache-module" #app
    "node-dates-module" #app
    "node-url-module" #app
    "node-params-module" #app
    "node-strings-module" #app
    "node-files-module" #app
    "node-util-module" #app
    "node-aws-module" #app
    "node-gcloud-module" #app

    "node-result-module" #app dates
    "node-validation-module" #app url
    "node-upload-module" #app aws gcloud files
    "node-mail-module" #app aws files
    
    "node-pagination-module" #app result
    "node-typeorm-module" #app files util
    
    "node-mongodb-module" #app pagination

    "node-log-module" #app mongodb
    "node-security-module" #app dates mongodb

    "node-handler-module" #app log result util
);

for module in "${modules[@]}"
do
    cd ../$module;
    pwd
    npm update && npm run compile:clean
    git add -A
    git commit -m "Recompilação $(date +'%d/%m/%Y %H:%I:%S')"
    git push origin master
    # git remote -v
    echo 
done