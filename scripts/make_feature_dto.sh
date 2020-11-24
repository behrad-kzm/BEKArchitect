#!/bin/sh

var_feature_name=$1
project_path=$2

template_path="templates/dto.tmp"
source_path=$project_path$'/web/dtos/'$var_feature_name$'DTO.py'

fileContent=`cat $template_path`
name_replaced_content=`echo $fileContent | perl -pe -w -e "s/<#feature_name#>/$var_feature_name/g;"`

echo "$name_replaced_content" > $source_path

echo $var_feature_name$'DTO.py created.\n'

init_file_path=$project_path$'/web/dtos/__init__.py'

fileContent=`cat $init_file_path`

new_import=$'\n'"from ."$var_feature_name"DTO import "$var_feature_name"DTO"$'\n'

apended_content=$fileContent$new_import

echo "$apended_content" > $init_file_path

echo $'/web/dtos/__init__.py updated.\n'