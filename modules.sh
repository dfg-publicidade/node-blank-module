#!/bin/bash

declare -a modules=(
    "node-app-module"

    "node-aws-module" #app
    "node-cache-module" #app
    "node-dates-module" #app
    "node-files-module" #app
    "node-gcloud-module" #app
    "node-pagereader-module" #app
    "node-params-module" #app
    "node-strings-module" #app
    "node-url-module" #app
    "node-util-module" #app

    "node-mail-module" #app aws files
    "node-result-module" #app dates
    "node-upload-module" #app aws gcloud files
    "node-validation-module" #app url
    
    "node-pagination-module" #app result
    
    "node-mongodb-module" #app files pagination
    "node-typeorm-module" #app files util strings
    "node-typeorm-module-2" #app files pagination util strings

    "node-log-module" #app mongodb
    "node-security-module" #app dates mongodb

    "node-handler-module" #app log result util
);

for module in "${modules[@]}"
do
    cd ../$module;
    pwd

    if [[ $1 == '--recompile' ]]; then
        npm update && npm run compile:clean
        git add -A
        git commit -m "Recompilação $(date +'%d/%m/%Y %H:%I:%S')"
        git push origin master
        echo 
    elif [[ $1 == '--test' ]]; then
        npm run test:all
        mkdir -p ~/Downloads/tests
        mkdir -p ~/Downloads/tests/${module}
        cp -R ./coverage/* ~/Downloads/tests/${module}
        echo
    fi    
done