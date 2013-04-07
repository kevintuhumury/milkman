module Milkman

  BASE_URL = "http://api.rememberthemilk.com/services/rest/"

  class NoMilkError          < StandardError; end
  class InvalidResponseError < StandardError; end

end
require "milkman/utility"
require "milkman/request"
require "milkman/client"
require "milkman/version"
