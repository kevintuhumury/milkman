require "httparty"

module Milkman
  class Request

    include HTTParty

    def self.call(url)
      new(url).parsed_response
    end

    def initialize(url)
      @url = url
    end

    def parsed_response
      if code == 200
        @response.parsed_response
      else
        raise InvalidResponseError, message
      end
    end

    private

    def request
      @response ||= self.class.get @url, format: :json
    end

    def response
      request.response
    end

    def code
      response.code.to_i
    end

    def message
      "#{@response.message} (#{@response.code}): #{@response.body} #{@response.inspect}"
    end

  end
end
