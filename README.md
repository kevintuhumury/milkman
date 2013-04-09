# Milkman

[![Build Status](https://travis-ci.org/kevintuhumury/milkman.png?branch=master)](https://travis-ci.org/kevintuhumury/milkman)
[![Dependency Status](https://gemnasium.com/kevintuhumury/milkman.png)](https://gemnasium.com/kevintuhumury/milkman)
[![Code Climate](https://codeclimate.com/github/kevintuhumury/milkman.png)](https://codeclimate.com/github/kevintuhumury/milkman)
[![Coverage Status](https://coveralls.io/repos/kevintuhumury/milkman/badge.png?branch=master)](https://coveralls.io/r/kevintuhumury/milkman)

This gem provides a Ruby wrapper around the Remember The Milk (RTM) API, using HTTParty. Milkman is a library to access the RTM API in an easy way. It maps all of the methods, which are described in the [official documentation](https://www.rememberthemilk.com/services/api/methods/). Whenever new methods are added to the RTM API, you'll be able to use them immediately through Milkman.

## Installation

Add this line to your application's Gemfile:

    gem 'milkman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install milkman

## Authorize Milkman

To use Milkman you'll need to authorize the gem with Remember The Milk. In order to do that, you'll need to apply for an API key and shared secret. When that's done, you'll need to run the `milkman` executable. Just follow the steps below.

### Apply for an API key and shared secret

You can retrieve an API key and shared secret from the official Remember The Milk [site](https://www.rememberthemilk.com/services/api/keys.rtm). Just follow the instructions and once you've received the API key and shared secret, move on to the next step.

### Run the `milkman` executable

    milkman authorize API_KEY SHARED_SECRET
    
Something like the following will be shown to you:

    Copy the URL below and follow the steps on Remember The Milk (RTM) to authorize Milkman:

    http://www.rememberthemilk.com/services/auth/?api_key=API_KEY&shared_secret=SHARED_SECRET&perms=read&format=json&api_sig=08da0d11ef239318027364133ac1a644

    Once you've authorized Milkman, you'll receive a hash called 'frob' from Remember The Milk. The page from Remember The Milk will list something like the following: 'No callback URL specified for this API key. Your frob value is YOUR_FROB'. Copy and paste that YOUR_FROB value below and press <enter>:

Copy the URL (as requested), copy the frob, paste it and press <enter> as described above. Once you've done that, you'll receive the authentication token (or auth token) from Remember The Milk.

    USERNAME, you've successfully authorized Milkman with Remember The Milk. As you can see we've received your username and an authorization token. Both this auth token, your API key and shared secret should be saved for later use. You can either save them in a YAML file and load them in your application, include them in the Ruby script where you're using this gem or set them as environment variables. That's completely up to you.

    Both the auth token, API key and shared secret are listed below. Save them using one of the methods above (or perhaps another solution) as you'll need all of them to use Milkman in your own project. Oh, and Remember... The Milk!

        api_key:       API_KEY
	    shared_secret: SHARED_SECRET
	    auth_token:    AUTH_TOKEN

Take note of the variables and save them, since you'll need them to use Milkman, which you're now able to.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
