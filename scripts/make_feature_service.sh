#!/bin/sh

var_feature_name=$1
project_path=$2

template_path="templates/service.tmp"
source_path=$project_path$'/serviceLayer/'$var_feature_name$'Service.py'

fileContent=`cat $template_path`
name_replaced_content=`echo $fileContent | perl -pe -w -e "s/<#feature_name#>/$var_feature_name/g;"`

echo "$name_replaced_content" > $source_path

echo $var_feature_name$'Service.py created.\n'
