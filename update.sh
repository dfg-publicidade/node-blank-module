#!/bin/bash

declare -a copyIfNotExists=("package.json" "src" "test");
declare -a copy=(".eslintrc.json" ".gitignore" "gulpfile.js" "tsconfig.json", "test/tsconfig.json");   

blankdir="./node-blank-module";

cd ../

for dir in `find *-module -type d -depth 0 `; do
    if [[ ${dir} != "node-blank-module" ]]; then
        for file in "${copyIfNotExists[@]}"
        do
            if [ ! -f $dir/$file ] && [ ! -d $dir/$file ]; then
                echo $dir/$file;
                rm -Rf $dir/$file && cp -R $blankdir/$file $dir
            fi
        done

        for file in "${copy[@]}"
        do
            echo $dir/$file;
            rm -Rf $dir/$file && cp $blankdir/$file $dir
            chmod -w $dir/$file
        done
    fi
done