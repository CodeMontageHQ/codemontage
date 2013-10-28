##Welcome to the CodeMontage Platform

**[CodeMontage](http://codemontage.com) is on a mission to help you become a software superhero.**

We believe coding can help save the world, and that by contributing to the right open source, real world projects, you can become a great coder.

If you'd like to join our quest to empower software superheroes, feel free to submit a pull request or reach out to us at hello@codemontage.com.



###Development Environment Setup

CodeMontage currently uses Ruby on Rails version 3.2.13 and Postgres 9.2.2.

To get started,
* Install Rails. We recommend [Rails Installer](http://railsinstaller.org).
* Install Postgres. We recommend [Postgres App](http://postgresapp.com). 
  (If you're using Mac OS X Lion, you may need [this fix for Postgres](http://stackoverflow.com/questions/9354122/how-to-install-postgresql-9-1-on-osx-lion).)
* Configure the app for your local database by copying *database.yml.sample* to *database.yml* and making any changes needed for your database setup (possibly `rake db:create`). Once your database is created, run `rake db:migrate`.
* Load helpful example data into your local database by running `rake db:seed`.
* In your application directory, run `rake secret > secret_token` to create a secret token for your local environment. This file is specific to your machine and will be ignored by git.
* If you'll be developing around Github login or registration, register your own [Github Oauth Application](https://github.com/settings/applications/new) for development and set your environment variables when you start your server. e.g. `GITHUB_KEY=your_key GITHUB_SECRET=your_secret rails server`

Once you've installed these dependencies, test your setup by running `rails server` and visiting your site at [http://localhost:3000](http://localhost:3000)

Congratulations, you're ready to help build CodeMontage!

## License

Copyright (c) 2013 Code for Humanity, LLC. See [LICENSE](https://github.com/CodeMontageHQ/codemontage/tree/master/LICENSE) for details.
