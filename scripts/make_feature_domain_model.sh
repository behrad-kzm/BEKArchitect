#!/bin/sh

var_feature_name=$1
project_path=$2

template_path="templates/domain_model.tmp"
source_path=$project_path$'/domain/models/'$var_feature_name$'DomainModel.py'

fileContent=`cat $template_path`
name_replaced_content=`echo $fileContent | perl -pe -w -e "s/<#feature_name#>/$var_feature_name/g;"`

echo "$name_replaced_content" > $source_path

echo $var_feature_name$'DomainModel.py created.\n'

init_file_path=$project_path$'/domain/models/__init__.py'

fileContent=`cat $init_file_path`

new_import="from ."$var_feature_name"DomainModel import "$var_feature_name"DomainModel"$'\n'

apended_content=$new_import$fileContent

echo "$apended_content" > $init_file_path

echo $'domain/models/__init__.py updated.\n'