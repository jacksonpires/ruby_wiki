# Ruby Wiki

An awesome Wiki created with Ruby and Rails!

## How to setup the project

1. Copy the project and install its dependencies:

    `git clone git@github.com:lucascaton/ruby_wiki.git ~/projects/ruby_wiki`

    `cd ~/projects/ruby_wiki`

    `bundle install`

2. Copy and edit the database configs:

    `cp config/database.yml.example config/database.yml`

3. Copy and edit the application configs:

    `cp config/application.yml.example config/application.yml`

4. Run `bundle exec rake db:setup` in order to setup the database;

5. Run `bundle exec rake db:bootstrap` in order to create the first user and other fake data;

6. Start the aplication: `bin/rails server` and done! You're ready to access the application: [localhost:3000](http://localhost:3000)

## First user

| email             | password  |
| :---------------- | :-------- |
| admin@example.com | secret123 |