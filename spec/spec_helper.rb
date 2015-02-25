require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter "spec"
end

RSpec.configure do |config|

  config.expect_with :rspec do |config|
    config.syntax = :expect
  end

end

require "milkman"
require "capture_stdout"
