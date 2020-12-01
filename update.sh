#!/bin/bash

declare -a copy=(".eslintrc.json" ".gitignore" "gulpfile.js" "tsconfig.json");   
declare -a copyIfNotExists=("package.json" "src");

blankdir="./blank-module";

cd ../

for dir in `find *-module -type d -depth 0 `; do
    if [[ ${dir} != "blank-module" ]]; then
        for file in "${copy[@]}"
        do
            echo $dir/$file;
            rm -Rf $dir/$file && cp $blankdir/$file $dir
            chmod -w $dir/$file
        done

        for file in "${copyIfNotExists[@]}"
        do
            if [ ! -f $dir/$file ] && [ ! -d $dir/$file ]; then
                echo $dir/$file;
                rm -Rf $dir/$file && cp -R $blankdir/$file $dir
                chmod -w $dir/$file
            fi
        done
    fi
done