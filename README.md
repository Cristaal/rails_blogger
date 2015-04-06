== README

Rails Blogger

This is a blogging application using Ruby on Rails and Devise authentication. Users are able to log in, makes posts, and comment on others posts. Uses AJAX not only to add comments to posts, but to update them as well.

Setup Instructions:

Gems
rails
pg
sass-rails
uglifier
coffee-rails
jquery-rails
turbolinks
pry
bootstrap-sass
shoulda-matchers
rspec-rails
capybara
faker
high_voltage
database_cleaner

Install Bundler:

$ gem install bundler
Run Bundler:

$ bundle
Start the database:

$ postgres
Create databases:

$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ rails server
Type the url localhost:3000 into your web browser.

MIT License 2015 Crystal Contreras-Grossman

Link to Heroku:
https://afternoon-plateau-9485.herokuapp.com/


Known Bugs:
No known bugs at this time
