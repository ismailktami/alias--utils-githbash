#!/bin/bash -e
output_dir=folder_executed
mkdir  $output_dir
for file in ./folder/*
do
    filename=$(basename "$file" .txt)
    filename="${filename%.*}"
    echo $filename
    mkdir  $output_dir/$filename
    newman run  "collection.json" -d $file > $output_dir/$filename/$filename.logs.txt  --insecure -r 'cli,htmlextra'  --reporter-htmlextra-export $output_dir/$filename/htmlreport.html 
    cp  $file  $output_dir/$filename
done