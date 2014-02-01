##Welcome to the CodeMontage Platform

**[CodeMontage](http://codemontage.com) empowers coders to improve their impact on the world.**

We believe coding can help save the world. With this platform, we aim to help coders everywhere find and contribute to open source projects that improve the world and make us better coders.

Join our mission to create superhero coders! You can get involved by taking any of the following actions:

1. [Register for CodeMontage](http://codemontage.com/auth/github).
2. [Follow us on Twitter](http://twitter.com/CodeMontage).
3. Be the change you wish to see by [creating a branch](http://guides.github.com/overviews/flow) submitting a [pull request](https://github.com/CodeMontageHQ/codemontage/pulls/new) to improve the platform. *Please include a screenshot of any user interface changes with all pull requests.*
4. Suggest an improvement by opening an [issue](https://github.com/CodeMontageHQ/codemontage/issues/new). 
(We recommend including [emojis](http://www.emoji-cheat-sheet.com) for maximum effectiveness.)
5. Reach out to us at hello@codemontage.com.


###Development Environment Setup

CodeMontage currently uses Ruby on Rails version 3.2.13 and Postgres 9.2.2.

To get started,
* Install Rails. We recommend [Rails Installer](http://railsinstaller.org).
* Install Postgres. We recommend [Postgres App](http://postgresapp.com). 
  (If you're using Mac OS X Lion, you may need [this fix for Postgres](http://stackoverflow.com/questions/9354122/how-to-install-postgresql-9-1-on-osx-lion).)
* Clone the CodeMontage Repo:  `git clone https://github.com/CodeMontageHQ/codemontage.git`
* Install dependencies: `cd codemontage`, `bundle install`
* Configure the app for your local database by copying *database.yml.sample* to *database.yml* and making any changes needed for your database setup (possibly `rake db:create`).
* Once your database is created, run `rake db:migrate`.
* Load helpful example data into your local database by running `rake db:seed`.
* If you'll be developing GitHub-related functionality, [register a GitHub API Application](https://github.com/settings/applications/new) using *Homepage URL* http://localhost:3000 and *Authorization callback URL* http://localhost:3000/auth/github/callback. Next, set your GitHub-related environment variables when you start your server. e.g. `GITHUB_KEY=client_id GITHUB_SECRET=client_secret rails server`. You can find the *Client ID* and *Client Secret* for your application from the [Applications page](http://github.com/settings/applications).

Once you've installed these dependencies, test your setup by running `rails server` and visiting your site at [http://localhost:3000](http://localhost:3000)

Congratulations, you're ready to help build CodeMontage!

## License

Copyright (c) 2013 Code for Humanity, LLC. See [LICENSE](https://github.com/CodeMontageHQ/codemontage/tree/master/LICENSE) for details.
