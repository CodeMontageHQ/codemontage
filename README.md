##Welcome to the CodeMontage Platform
[![Build Status](https://travis-ci.org/CodeMontageHQ/codemontage.png)](https://travis-ci.org/CodeMontageHQ/codemontage)

**[CodeMontage](http://codemontage.com) empowers coders to improve their impact on the world.**

We believe coding can help save the world. With this platform, we aim to help coders everywhere find and contribute to open source projects that improve the world and make us better coders.

Join our mission to create superhero coders! You can get involved by taking any of the following actions:

1. [Register for CodeMontage](http://codemontage.com/auth/github).
2. [Follow us on Twitter](http://twitter.com/CodeMontage).
3. Be the change you wish to see by [creating a branch](http://guides.github.com/overviews/flow) submitting a [pull request](https://github.com/CodeMontageHQ/codemontage/pulls/new) to improve the platform. *Please include a screenshot of any user interface changes with all pull requests.*
4. Suggest an improvement by opening an [issue](https://github.com/CodeMontageHQ/codemontage/issues/new). Please follow [our issue template](https://github.com/CodeMontageHQ/codemontage/issues/347) and use multiple [emojis](http://www.emoji-cheat-sheet.com) for maximum effectiveness. :+1::100::wink:
5. Reach out to us at hello@codemontage.com.


###Development Environment Setup

These setup instructions have been tested on Mac OS X, Microsoft Windows 7 with and without Cygwin, and Linux (Ubuntu 10.8.) Installing and running the site
under Windows with or without Cygwin may be possible with enough environmental modifications, but doing so is outside the scope of this document.

CodeMontage currently uses Ruby on Rails 3.2.17 and Postgres 9.2.2. The Gemfile specifies Ruby 2.0.0, but the site also runs in development under 1.9.3 and 2.1.1 (tested in Ubuntu.)

To get started,
* Install Rails. If you're using a Mac, we recommend [Rails Installer](http://railsinstaller.org). Under Ubuntu, follow the instructions [here](https://www.digitalocean.com/community/articles/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm).
* Install Postgres. For the Mac, we recommend [Postgres App](http://postgresapp.com). (If you're using Mac OS X Lion, you may need [this fix for Postgres](http://stackoverflow.com/questions/9354122/how-to-install-postgresql-9-1-on-osx-lion).) Under Ubuntu, follow the instructions [here](http://stackoverflow.com/questions/11092807/installing-postgresql-on-ubuntu-for-ruby-on-rails).

* Clone the CodeMontage Repo:
  `git clone https://github.com/CodeMontageHQ/codemontage.git`

* Install dependencies:
  ```sh
  cd codemontage
  bundle install
  ```

* Configure the app for your local database by copying database.yml.sample to database.yml and adding a valid username and password. Make any changes needed for your database setup ( and possibly `rake db:create`).
  `cp config/database.yml.sample config/database.yml`

* Create database:
  `rake db:create`

* Run migrations:
  `rake db:migrate`

* Load helpful example data into your local database:
  `rake db:seed`

* If you'll be developing GitHub-related functionality, [register a GitHub API Application](https://github.com/settings/applications/new) using *Homepage URL* http://localhost:3000 and *Authorization callback URL* http://localhost:3000/auth/github/callback. Next, set your GitHub-related environment variables in a file called `.env`:
    ```
    GITHUB_KEY=client_id
    GITHUB_SECRET=client_secret
    ```
  You can find the *Client ID* and *Client Secret* for your application from the [Applications page](http://github.com/settings/applications).

* If you don't have a JavaScript runtime installed, install `nodejs`:

  Linux
  `sudo apt-get install nodejs`

  Mac
  `brew install nodejs`

* Once you've installed these dependencies, test your setup by running `rails server` and visiting your site at [http://localhost:3000](http://localhost:3000)

Congratulations, you're ready to help build CodeMontage!

## License

Copyright (c) 2014 Code for Humanity, LLC. See [LICENSE](https://github.com/CodeMontageHQ/codemontage/tree/master/LICENSE) for details.
