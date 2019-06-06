# Bookmark Manager
This is a simple Bookmark Manager application which has been developed using the BDD cycle and a test driven approach to fulfil the user stories below.

## User Stories
```
As a time-pressed user
So that I can quickly do to websites I regularly visit
I would like to see a list of bookmarks

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

As a time-pressed user
So that I can remove a website I no longer visit
I would like to delete a bookmark from bookmark manager

As a time-pressed user
So that I can keep my bookmark information relevant
I would like to update a bookmark

As a time-pressed user
So that I can note my opinions about a bookmark
I would like to add comments to a bookmark

As a time-pressed user
So that I can categorise my bookmarks
I would like to add a tag to a bookmarks

As a time-pressed user
So that I can find relevant bookmarks
I would like to filter bookmarks by a tag

As a time-pressed user
So that I can have a personalised bookmark manager
I would like to register with my email address

As a time-pressed user
So that I can have a secure account
I would like to login with my email address and password

As a time-pressed user
So that I can keep my account secure while offline
I would like to logout
```

## How to use

### Install project dependencies
Clone the repo to your local machine, change into the directory, then:
```
$ bundle install
```

### Setup the databases
You will need to have the PostgreSQL database management system installed to proceed.

Connect to psql:
```
$ psql
```

Create the development and test databases:
```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

Connect to each database in psql and run the SQL scripts in the db/migrations folder in the given order.

### Run the app
```
$ rackup
```
Visit http://localhost:9292 and follow the instructions on screen.


### Run tests
```
rspec
```
