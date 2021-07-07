#!/bin/bash

declare -a modules=(
    "node-app-module"
    #debug
    #express

    "node-aws-module" #app
    #aws-sdk
    "node-cache-module" #app
    #express-expeditious
    "node-dates-module" #app
    #moment-timezone
    "node-files-module" #app
    #app-root-path
    #fs-extra
    #mime-type
    "node-gcloud-module" #app
    #@google-cloud/storage
    "node-pagereader-module" #app
    #puppeteer
    "node-strings-module" #app
    "node-url-module" #app
    "node-util-module" #app
    
    "node-calendar-module" #app dates
    "node-mail-module" #app aws files
    #nodemailer
    "node-params-module" #app dates
    "node-result-module" #app dates
    "node-upload-module" #app aws gcloud files
    #express-fileupload
    #sharp
    "node-validation-module" #app url
    #js-brasil
    #validator
    
    "node-pagination-module" #app result
    "node-tasks-module" #app #result
    #cron
    
    "node-mongodb-module" #app files pagination
    "node-typeorm-module" #app files util strings params
    #mysql
    #typeorm
    "node-typeorm-module-2" #app files pagination util strings params
    #mysql
    #typeorm
    
    "node-log-module" #app mongodb
    #ipware
    "node-security-module" #app dates mongodb
    #bcryptjs
    #dotenv
    #hashids
    #jsonwebtoken

    "node-filtersort-module" #app strings params mongodb typeorm typeorm2 security
    "node-handler-module" #app log result util
    "node-controllers-module" #app cache calendar params result security strings util validation
    #axios
    #expeditious-engine-redis
    #i18n
    #ics
    #tedis
    #validate

    "node-application-module" #app controllers handler util tasks
    #config
    #express-ws
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