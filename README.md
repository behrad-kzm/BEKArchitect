# BEKArchitect
Shell scripts for automatically generate python modules. It will generate python files and classes for service layer, repository layer, models, database, API
<img src="https://github.com/behrad-kzm/BEKDesing/blob/master/Images/BEKHeader.png">

BEKArchitect helps developers to created features in fastest way as possible. creating new features in desired architecture with files and classes are a time consuming job for developers.
with the BEKArchitect this action will complete in single line of command (in a second).

## Demo
[TODO]

## Example
```
source BEKArchitect.sh MyBeautifulFeatureName path/to/project/directory/

```

## How It works?
BEKArchitect uses files with extension `.tmp`.
They contains base structure for the file that will going to generate


## Volunteer accepted
BEKArchitect only works for project structures like below:

```
Project directory
                  |____app.py
                  |____wsgi.py
                  |____domain
                             |____models
                                        |____ExampleDomainModel.py
                  |____serviceLayer
                                    |____ExampleService.py
                                    |____core
                                             |____ServiceProvider.py
                                             
                  |____repository
                                 |____ExampleRepository.py
                                 |____core
                                          |____RepositoryProvider.py
                  |____web
                          |____dtos
                                   |____ExampleDTO.py
                          |____views
                                   |____ExampleView.py
                          |____BaseRouter.py
                  |____requirements.txt
```


## Author
Behrad Kazemi, Behradkzm@gmail.com, bekapps.com
<a href="https://bekapps.com"> Visit Web Site </a>
## License

__IMPORTANT:__

BEKArchitect is available under the GPL v3 license. See the LICENSE file for more info.
Contact me for commercial use license.
