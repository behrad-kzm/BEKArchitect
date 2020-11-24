#!/bin/sh

var_feature_name=$1
project_path=$2

template_path="templates/repository.tmp"
service_path=$project_path$'/repository/'$var_feature_name$'Repository.py'

fileContent=`cat $template_path`
name_replaced_content=`echo $fileContent | perl -pe -w -e "s/<#feature_name#>/$var_feature_name/g;"`

echo "$name_replaced_content" > $service_path

echo $var_feature_name$'Repository.py created.\n'
