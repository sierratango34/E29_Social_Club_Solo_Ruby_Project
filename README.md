# E29 Social Club

[Launch the app on Heroku](https://e29-social-club.herokuapp.com)

This is the first large scale, full-stack web application developed 4 weeks into CodeClan's 16-week [Professional Software Development](https://codeclan.com/courses/professional-software-development/) course. 

## Overview
It is a booking system used by the Social Club Organiser, to add/edit members and events; to book members onto events; and to keep track of all bookings.

## Original Gym Brief
"A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes."

### MVP
* The app should allow the gym to create / edit / delete members
* The app should allow the gym to create / edit / delete classes
* The app should allow the gym to add members to specific classes
* The app should show a list of all upcoming classes
* The app should show all members that are registered for a particular class

## My Personal Spin on the Brief
I decided to theme my app on a 'Social Club' rather than a Gym, to reflect my assumed role as principal organiser of Cohort E29's social events throughout the course. Whilst the app still referred to _'members'_ - the 'classes' were changed to _'events'_.

##Installation

* Install Postgres: `$ brew install postgres && brew services start postgresql`

* Install rvm http://rvm.io/

* Install bundler: `$ gem install bundler`

* Install pry: `$ gem install pry`

* If prompted, install the version of Ruby required for this project

* Install project gems: `$ bundler install`

* Select 'run-local' branch `$ git clone ...`

* Move into cloned repository

* Create development database: `$ createdb e29_social_club`

* Set up tables: `$ psql -d e29_social_club -f db/e29_social_club.sql`

* Seed development database with some data `$ ruby db/seeds.rb`

##Run

* Run the app: `$ ruby app.rb`

* Go to your browser to sinatra port (default: http://localhost:4567/)
