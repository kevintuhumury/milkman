require "i18n"

module Milkman

  AUTH_URL    = "https://www.rememberthemilk.com/services/auth/"
  BASE_URL    = "http://api.rememberthemilk.com/services/rest/"
  API_VERSION = 2

  I18n.load_path += Dir.glob(File.join(File.dirname(__FILE__), "locales/*.yml"))

  class NoMilkError < StandardError; end
  class InvalidResponseError < StandardError; end

end

require "milkman/cli"
require "milkman/utility"
require "milkman/request"
require "milkman/client"
require "milkman/authorizer"
require "milkman/version"
