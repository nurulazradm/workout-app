### 1- Install RSpec and Capybara

Gemfile:
* gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
* gem 'capybara', '~> 3.2', '>= 3.2.1'

Rake:
* rails g rspec:install
* bundle binstubs rspec-core

RSpec Commands:
* rails generate rspec:feature NAME [--singularize]

Capybara Cheatsheet:
* expect(page).to have_link('')
* expect(page).to have_content('')

### 2- Install Guard

Gemfile:
* gem 'guard-rspec', '~> 4.7', '>= 4.7.3'

Bundle:
* bundle exec guard init rspec

### 3- Rails Generator

Skip rails default generator:
* --skip-routes --no-helper --no-assets

Skip rspec default generator:
* --no-controller-specs --no-view-specs --no-helper-specs

### 4- Bootstrap

Gemfile:
* gem 'bootstrap', '~> 4.1', '>= 4.1.1'
* gem 'jquery-rails', '~> 4.3', '>= 4.3.3'

Stylesheet:
* mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
* replace the content with ```@import "bootstrap";```

Javascript:

After ```//= require rails-ujs```, add the followings:

* //= require popper
* //= require bootstrap

### 5- Devise

Gemfile:
* gem 'devise', '~> 4.4', '>= 4.4.3'

Rake:
* rails g devise:install
