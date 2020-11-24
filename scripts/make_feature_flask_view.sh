#!/bin/sh

var_feature_name=$1
lowecased_feature_name=`echo $var_feature_name | perl -pe 's/(^|[A-Z])./_$&/g;s/^.//g;s/(^|[A-Z])./lc($&)/ge'`
project_path=$2

template_path="templates/flask_view.tmp"
source_path=$project_path$'/web/views/'$var_feature_name$'View.py'

fileContent=`cat $template_path`
name_replaced_content=`echo $fileContent | perl -pe -w -e "s/<#feature_name#>/$var_feature_name/g;s/<#underscored_feature_name#>/$lowecased_feature_name/g;"`

echo "$name_replaced_content" > $source_path

echo $var_feature_name$'View.py created.\n'

init_file_path=$project_path$'/web/views/__init__.py'

fileContent=`cat $init_file_path`

new_import="from ."$var_feature_name"View import "$var_feature_name"View"$'\n'

apended_content=$new_import$fileContent

echo "$apended_content" > $init_file_path

echo $'/web/views/__init__.py updated.\n'