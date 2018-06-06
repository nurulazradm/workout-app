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
