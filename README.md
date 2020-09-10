# README

# Marley Spon recipe

This app pulls the recipes from the contentful api and stores it in a local redis db and then displays it for users.

## Installation

You need to have ruby and rails installed. also you need to have redis installed and running before attempting to run this application.

After you have confirmed you have the above installed ready to go, pull down this repo and run

    $ bundle install

then you need to run 

    $ yarn install

You should then add a .env file and add these keys
```
SPACE_ID='contentful_space_id'
ENVIRONMENT_ID='contentful_environment'
ACCESS_TOKEN='contentful_access_token'
```

Then you need to run:

    $ bin/rails marley_spoon:sync_recipes

when this has finished, you need to run

    $ ./bin/webpack-dev-server

and

    $ bin/rails server


Then you can proceed to 
```
  localhost:3000
```
