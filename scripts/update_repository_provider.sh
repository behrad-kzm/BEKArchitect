#!/bin/sh

var_feature_name=$1
lowecased_feature_name=`echo $var_feature_name | perl -pe 's/(^|[A-Z])./_$&/g;s/^.//g;s/(^|[A-Z])./lc($&)/ge'`
project_path=$2

repository_provider_path=$project_dir$'/repository/core/RepositoryProvider.py'

fileContent=`cat $repository_provider_path`

header_template="def make_"$lowecased_feature_name"(self):"
body_template="collection = self.database.user_db[\"$lowecased_feature_name\"]\n        return $1Repository(collection)"
new_function_template=$'\n\n    '$header_template$'\n        '$body_template$'\n'
new_import="from repository."$var_feature_name"Repository import "$var_feature_name"Repository"$'\n'

apended_content=$new_import$fileContent$new_function_template

echo "$apended_content" > $repository_provider_path

echo $'RepositoryProvicer.py updated.\n'
