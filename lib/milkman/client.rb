module Milkman
  class Client

    include Utility

    attr_accessor :options, :shared_secret

    def initialize(attributes)
      @shared_secret = attributes.delete(:shared_secret)
      @options       = attributes.merge default_options

      if !has_required_options?
        raise NoMilkError, "The API key and shared secret are required."
      end
    end

    def get(method, request_options = {})
      signed_options = sign shared_secret, options.merge!(method: method).merge!(request_options)
      Milkman::Request.call request_url(signed_options)
    end

    private

    def has_required_options?
      options[:api_key] && shared_secret
    end

  end
end
