#!/bin/sh

clear

echo "Injecting $1 ..."
current_dir=$PWD
project_dir=$2

serivce_provider_path=$project_dir$'/serviceLayer/core/ServiceProvider.py'
repository_provider_path=$project_dir$'/repository/core/RepositoryProvider.py'
domain_models_dir=$project_dir$'/domain/models/'
web_dtos_dir=$project_dir$'/web/dtos/'
web_views_dir=$project_dir$'/web/views'

echo $'Checking project structure...'

if [ $serivce_provider_path ] \
	&& [ $repository_provider_path ] \
	&& [ -d $domain_models_dir ] \
	&& [ -d $web_dtos_dir ] \
	&& [ -d $web_views_dir ];
then 
	echo $'Project structure tested sucessfully!';
else
	echo "Project is not compatible with BEKArchitect"
	exit;
fi

cd scripts/
project_dir="../$project_dir"

source update_service_provider.sh $1 $project_dir
source update_repository_provider.sh $1 $project_dir
source make_feature_service.sh $1 $project_dir
source make_feature_repository.sh $1 $project_dir
source make_feature_domain_model.sh $1 $project_dir
source make_feature_dto.sh $1 $project_dir
source make_feature_flask_view.sh $1 $project_dir

cd ../