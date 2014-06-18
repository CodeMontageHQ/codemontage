##Welcome to the CodeMontage Platform
[![Build Status](https://travis-ci.org/CodeMontageHQ/codemontage.png)](https://travis-ci.org/CodeMontageHQ/codemontage)

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

These setup instructions have been tested on Mac OS X, Microsoft Windows 7 with and without Cygwin, and Linux (Ubuntu 10.8.) Installing and running the site
under Windows with or without Cygwin may be possible with enough environmental modifications, but doing so is outside the scope of this document. To develop for CodeMontage on Windows, see "Using Vagrant" below.

CodeMontage currently uses Ruby on Rails 3.2.13 and Postgres 9.2.2. The Gemfile specifies Ruby 2.0.0, but the site also runs in development under 1.9.3 and 
2.1.1 (tested in Ubuntu.)

To get started,
* Install Rails. If you're using a Mac, we recommend [Rails Installer](http://railsinstaller.org). Under Ubuntu, follow the instructions [here](https://www.digitalocean.com/community/articles/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm).
* Install Postgres. For the Mac, we recommend [Postgres App](http://postgresapp.com). (If you're using Mac OS X Lion, you may need [this fix for Postgres](http://stackoverflow.com/questions/9354122/how-to-install-postgresql-9-1-on-osx-lion).) Under Ubuntu, follow the instructions [here](http://stackoverflow.com/questions/11092807/installing-postgresql-on-ubuntu-for-ruby-on-rails).
  
* Clone the CodeMontage Repo:  `git clone https://github.com/CodeMontageHQ/codemontage.git`
* Install dependencies: `cd codemontage`, `bundle install`
* Configure the app for your local database by copying *database.yml.sample* to *database.yml* and adding a valid username and password. Make any changes needed for your database setup ( and possibly `rake db:create`).
* Once your database is created, run `rake db:migrate`.
* Load helpful example data into your local database by running `rake db:seed`.
* If you'll be developing GitHub-related functionality, [register a GitHub API Application](https://github.com/settings/applications/new) using *Homepage URL* http://localhost:3000 and *Authorization callback URL* http://localhost:3000/auth/github/callback. Next, set your GitHub-related environment variables when you start your server. e.g. `GITHUB_KEY=client_id GITHUB_SECRET=client_secret rails server`. You can find the *Client ID* and *Client Secret* for your application from the [Applications page](http://github.com/settings/applications).
* On the Mac, you will usually have a JavaScript runtime already installed. If you don't have one on Ubuntu, you can get one by running `sudo apt-get install nodejs`.

Once you've installed these dependencies, test your setup by running `rails server` and visiting your site at [http://localhost:3000](http://localhost:3000)

Congratulations, you're ready to help build CodeMontage!


###Using Vagrant
While it's frequently possible to run CodeMontage directly on your development machine, it's also possible to run the site on a VM managed by [Vagrant](http://www.vagrantup.com/). Vagrant is a virtual environment manager that works on top of virtualization tools like Oracle Virtual Box and Amazon EC2.

These instructions have been tested on Windows 7 using Oracle VirtualBox, but should ultimately work on any OS running VirtualBox. Vagrant support is currently a work in progress and may not operate correctly on all platforms due to a confict with the current version of sass-rails.

* If you don't already have one, install a VM host. This was tested using [Oracle VirtualBox](https://www.virtualbox.org/).
* [Install Vagrant](http://www.vagrantup.com/downloads). This was tested on version 1.5.0. If you have an older version of it intalled using RubyGems, uninstall the older version first.
* From the home directory of CodeMontage, execute `vagrant up`. This will launch the virtual machine.
* Once the VM is running, execute `vagrant ssh` to shell into the VM.
* Our VM is missing one crucial tool that CodeMontage requires. Execute `sudo apt-get install libyaml-dev`.
* In the VM, switch to the /vagrant directory.

* From this point forward, it's a lot like any regular rails installation. Execute `bundle install` `rake db:create:all` `rake db:migrate` and `rake db:seed`. Then
execute `rails server`.
* Open a browser to localhost:4567 to see CodeMontage running on your VM.



## License

Copyright (c) 2014 Code for Humanity, LLC. See [LICENSE](https://github.com/CodeMontageHQ/codemontage/tree/master/LICENSE) for details.
