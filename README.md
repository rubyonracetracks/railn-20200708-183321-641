<!--- BEGIN: badges --->
<!--- END: badges --->

# Generic App Template

Welcome to Generic App Template!

## How was this app created?
This Rails app was created with 
[Rails Neutrino](https://www.railsneutrino.com/).  The time at which this app was created with the Rails Neutrino script is denoted in the config/rails_neutrino_timestamp.txt file.

## What's the point?
* Rails Neutrino begins with the "rails new" command and automatically constructs a comprehensive Rails template app that includes the features that all or most Rails apps need.  This 1-step process is completed in minutes, not hours or days.
* This template app is used by the [Generic App](https://www.genericapp.net/) tool to create a Rails app.  This app is comprehensive, of high quality, and up to date.  A new template app is created periodically for use as the new basis for Generic App.
* Use of this Rails app improves productivity by orders of magnitude when it's time to create a new app.  Features provided through automatic processes include a comprehensive test suite, Bash scripts for common tasks, outlines of the MVC architecture, static pages, and user and admin authentication provided by the Devise gem.

## Setup Procedure
* Open your terminal.
* Use the "git clone" command to download this repository to your local machine.
* Within the root directory of this project, enter the command "bash build.sh; bash server.sh" to set up this app and run the Rails and MailCatcher servers afterward in this terminal tab.  In the end, you will be able to view this app at http://localhost:3000/ and view the MailCatcher interface at http://localhost:1080/.
* Create a second terminal tab for entering commands.

## Other Important Commands
* `bash nuke.sh`: This command deletes all Docker images and containers.  It's handy for resetting your Docker setup.
* `bash git_check.sh`: Before you use the "git add" and "git commit" commands, run the git_check.sh script to make sure that all tests pass, annotate the code, and make sure that this app complies with RuboCop and Rails Best Practices.
* `bash exec.sh *`: Add the command "bash exec.sh" to the beginning of any command in order to execute it within the Docker container (instead of the host OS).
* `bash pg_setup.sh`: Use this command to convert this app from SQLite to PostgreSQL.
* `bash root.sh`: Use this command to open a Bash shell in the Docker container as root.
* `bash sandbox.sh`: Use this command to run the Rails sandbox.
* `bash test_app.sh`: Use this command to run the full test suite.
* `bash testc.sh`: Use this command to run just the controller tests.
* `bash testm.sh`: Use this command to run just the model tests.
* `bash testh.sh`: Use this command to run just the helper and mailer tests.
* `bash upgrade_gems.sh`: Use this command to run "bundle update".
* `bash outline-short.sh`: Use this command to annotate the code and print a file trees of selected parts of this app's source code in the log directory.
* `bash outline.sh`: Use this command to run the outline-short.sh script and use the railroady and rails-erd gems to print block diagrams of this app to files in the log directory.
* `bash test_code.sh`: Use this command to run RuboCop, Rails Best Practices, and other tools for analyzing this app's source code.

## Things To Upgrade
* [Ruby](https://hub.docker.com/_/ruby) version: specified in the Dockerfile, Gemfile, .ruby-version file, and .travis.yml file
* [Node](https://nodejs.org/en/) version: specified in the Dockerfile
* [PostgreSQL](https://hub.docker.com/_/postgres) version: specified in the docker-compose.yml file and .travis.yml file
* [Bundler](https://rubygems.org/gems/bundler/versions) version: specified at the end of the Gemfile.lock file
* Gems in the Gemfile
