module Milkman

  BASE_URL = "http://api.rememberthemilk.com/services/rest/"

  class InvalidResponseError < StandardError; end

end
require "milkman/request"
require "milkman/version"
