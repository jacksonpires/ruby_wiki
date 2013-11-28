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

## Licence

**The MIT License (MIT)**

**Copyright (c) 2013 Lucas Caton**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
