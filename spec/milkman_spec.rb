require "spec_helper"

describe Milkman do

  it "knows its AUTH_URL" do
    Milkman::AUTH_URL.should eq "http://www.rememberthemilk.com/services/auth/"
  end

  it "knows its BASE_URL" do
    Milkman::BASE_URL.should eq "http://api.rememberthemilk.com/services/rest/"
  end

end
