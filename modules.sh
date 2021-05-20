#!/bin/bash

declare -a modules=(
    "node-app-module"

    "node-aws-module" #app
    "node-cache-module" #app
    "node-dates-module" #app
    "node-files-module" #app
    "node-gcloud-module" #app
    "node-pagereader-module" #app
    "node-strings-module" #app
    "node-url-module" #app
    "node-util-module" #app

    "node-mail-module" #app aws files
    "node-params-module" #app dates
    "node-result-module" #app dates
    "node-upload-module" #app aws gcloud files
    "node-validation-module" #app url
    
    "node-pagination-module" #app result
    
    "node-mongodb-module" #app files pagination
    "node-typeorm-module" #app files util strings params
    "node-typeorm-module-2" #app files pagination util strings params
    
    "node-log-module" #app mongodb
    "node-security-module" #app dates mongodb

    "node-filtersort-module" #app strings params mongodb typeorm security
    "node-handler-module" #app log result util
);

for module in "${modules[@]}"
do
    cd ../$module;
    pwd

    if [[ $1 == '--upgrade' ]]; then
        npm upgrade && npm run compile:clean
        git add -A
        git commit -m "Atualização de dependências $(date +'%d/%m/%Y %H:%I:%S')"
        git push origin master
        echo   
    elif [[ $1 == '--recompile' ]]; then
        npm update && npm run compile:clean
        git add -A
        git commit -m "Recompilação $(date +'%d/%m/%Y %H:%I:%S')"
        git push origin master
        echo 
    elif [[ $1 == '--commit' ]]; then
        git add -A
        git commit -m "Refatoramentos $(date +'%d/%m/%Y %H:%I:%S')"
        git push origin master
        echo
    elif [[ $1 == '--test' ]]; then
        npm run test:all
        mkdir -p ~/Downloads/tests
        mkdir -p ~/Downloads/tests/${module}
        cp -R ./coverage/* ~/Downloads/tests/${module}
        echo
    elif [[ $1 == '--check-tests' ]]; then
        eslint test --ext .ts
        echo
    fi
done