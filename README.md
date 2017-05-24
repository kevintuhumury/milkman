# Milkman

[![Gem Version](https://badge.fury.io/rb/milkman.png)](http://badge.fury.io/rb/milkman)
[![Build Status](https://travis-ci.org/kevintuhumury/milkman.png?branch=master)](https://travis-ci.org/kevintuhumury/milkman)
[![Dependency Status](https://gemnasium.com/kevintuhumury/milkman.png)](https://gemnasium.com/kevintuhumury/milkman)
[![Code Climate](https://codeclimate.com/github/kevintuhumury/milkman.png)](https://codeclimate.com/github/kevintuhumury/milkman)
[![Coverage Status](https://coveralls.io/repos/kevintuhumury/milkman/badge.png?branch=master)](https://coveralls.io/r/kevintuhumury/milkman)

This gem provides a Ruby wrapper around the [Remember The Milk](https://www.rememberthemilk.com) (RTM) API, using HTTParty. Milkman is a library to access the RTM API in an easy way. It maps all of the methods, which are described in the [official documentation](https://www.rememberthemilk.com/services/api/methods/). Whenever new methods are added to the RTM API, you'll be able to use them immediately through Milkman.

## Installation

Add this line to your application's Gemfile:

    gem 'milkman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install milkman

## Authorize Milkman

To use Milkman you'll need to authorize the gem with Remember The Milk. In order to do that, you'll need to apply for an API key and shared secret. When that's done, you'll need to run the `milkman` executable.

### Apply for an API key and shared secret

You can retrieve an API key and shared secret from the official Remember The Milk [site](https://www.rememberthemilk.com/services/api/keys.rtm). Just follow the instructions and once you've received the API key and shared secret, move on to the next step.

### Run the `milkman` executable

    milkman authorize API_KEY SHARED_SECRET

Something like the following will be shown to you:

    Copy the URL below and follow the steps on Remember The Milk (RTM) to authorize Milkman:

    https://www.rememberthemilk.com/services/auth/?api_key=API_KEY&perms=read&format=json&v=2&api_sig=08da0d11ef239318027364133ac1a644

    Once you've authorized Milkman, you'll receive a hash called 'frob' from Remember The Milk. The page from Remember The Milk will list something like the following: 'No callback URL specified for this API key. Your frob value is YOUR_FROB'. Copy and paste that YOUR_FROB value below and press <enter>:

Copy the URL (as requested) and paste it in your browser. Next copy the frob from the Remember The Milk website, paste it in your shell and press enter. Once you've done that, you'll receive the authentication token (auth token) from Remember The Milk:

    USERNAME, you've successfully authorized Milkman with Remember The Milk. As you can see we've received your username and an authorization token. Both this auth token, your API key and shared secret should be saved for later use. You can either save them in a YAML file and load them in your application, include them in the Ruby script where you're using this gem or set them as environment variables. That's completely up to you.

    Both the auth token, API key and shared secret are listed below. Save them using one of the methods above (or perhaps another solution) as you'll need all of them to use Milkman in your own project. Oh, and Remember... The Milk!

        api_key:       API_KEY
	    shared_secret: SHARED_SECRET
	    auth_token:    AUTH_TOKEN

Take note of the variables and save them, since you'll need them to use Milkman.

## Remember The Milk API version

From Milkman version 0.0.5 and onwards Milkman will use RTM API version 2 by default.

## Using Milkman

Using Milkman is easy. All you need to know is that all calls go through the `Milkman::Client` class. Specifically it's `get` method. Let's say you want to retrieve all your tasks from RTM. Well, there's a method for that and it's called: `rtm.tasks.getList`. More information about that method can be found [here](https://www.rememberthemilk.com/services/api/methods/rtm.tasks.getList.rtm).

### Create an instance of the Milkman client

In order to retrieve the above information, we'll need an instance of the Milkman client. So let's create it:

```ruby
client = Milkman::Client.new api_key: API_KEY, shared_secret: SHARED_SECRET, auth_token: AUTH_TOKEN
```

That's it.

### Milking the cow, err... Calling our method

Now, let's call our `rtm.tasks.getList` method:

```ruby
client.get "rtm.tasks.getList"
```

The above call will return every task you have. As can be seen on the [API page](https://www.rememberthemilk.com/services/api/methods/rtm.tasks.getList.rtm) of the above method, there are a couple of optional parameters, like `list_id`, `filter` and `last_sync`. These can be used as follows:

```ruby
client.get "rtm.tasks.getList", { list_id: 1, filter: "some filter" }
```

### Response format

Eventhough the API documentation shows the responses as XML, Milkman will return JSON as it's default response format.

### Example usage of Milkman

Milkman was actually created to power the [Milkman Dashing widget](https://github.com/kevintuhumury/dashing-milkman). You can check out a preview [here](https://github.com/kevintuhumury/dashing-milkman#preview).

## Contributing

You're very welcome to contribute to this gem. To do so, please follow these steps:

1. Fork this project
2. Clone your fork on your local machine
3. Install the development dependencies with `bundle install`
4. Create your feature branch with `git checkout -b my-new-feature`
5. Run the specs with `rspec` and make sure everything is covered with RSpec
6. Commit your changes `git commit -am 'Added new feature'`
7. Push to your branch `git push origin my-new-feature`
8. Create a new Pull Request

## Copyright

Copyright 2013 Kevin Tuhumury. Released under the MIT License.
