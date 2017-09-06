# Envirorobots

This is a minimal Rails Engine to supply environment specific robots.txt files for your rails app.

This is to configure your robots.txt to prevent search engine bots from accidentally indexing your test or staging servers while still allowing indexing of production servers.

It is very similar to https://github.com/LaunchAcademy/roboto

## Usage

Add this line to your config/routes.rb

```ruby
  mount Envirorobots::Engine => '/'
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'envirorobots'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install envirorobots
```

And then to install the production & development versions of robots.txt
```bash
rails g envirorobots:install
```

This command will move your existing public/robots.txt to config/envirorobots/production.robots.txt

## Health
[![Build Status](https://travis-ci.org/trammel/envirorobots.svg?branch=master)](https://travis-ci.org/trammel/envirorobots/builds)

## Contributing
Fork, create branch, write tests, implement feature, fix bugs, submit PR.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
