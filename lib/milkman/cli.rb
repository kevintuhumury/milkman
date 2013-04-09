require "thor"

module Milkman
  class CLI < Thor

    desc "authorize [API_KEY] [SHARED_SECRET]", "Authorize Milkman with Remember The Milk (RTM) by entering an API key and shared secret."
    def authorize(api_key, shared_secret)
      Authorizer.authorize api_key: api_key, shared_secret: shared_secret
    end

  end
end
