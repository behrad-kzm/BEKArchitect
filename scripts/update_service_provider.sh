#!/bin/sh

var_feature_name=$1
lowecased_feature_name=`echo $var_feature_name | perl -pe 's/(^|[A-Z])./_$&/g;s/^.//g;s/(^|[A-Z])./lc($&)/ge'`
project_path=$2

service_provider_path=$project_path$'/serviceLayer/core/ServiceProvider.py'

fileContent=`cat $service_provider_path`

header_template="def make_"$lowecased_feature_name"_service(self):"
body_template="return $1Service(self.repository_provider.make_$lowecased_feature_name(), self.auth)"
new_function_template=$'\n\n    '$header_template$'\n        '$body_template$'\n'
new_import="from serviceLayer."$var_feature_name"Service import "$var_feature_name"Service"$'\n'

apended_content=$new_import$fileContent$new_function_template

echo "$apended_content" > $service_provider_path

echo $'ServiceProvider.py updated.\n'

base_router_path=$project_path$'/web/BaseRouter.py'

fileContent=`cat $base_router_path`

body_template=$var_feature_name$'View.register(app, route_base=base_url)'
new_function_template=$'\n    '$body_template$'\n'
new_import="from web.views import "$var_feature_name"View"$'\n'

apended_content=$new_import$fileContent$new_function_template

echo "$apended_content" > $base_router_path

echo $'BaseRouter.py updated.\n'
