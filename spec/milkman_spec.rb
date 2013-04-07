require "spec_helper"

describe Milkman do

  it "knows its BASE_URL" do
    Milkman::BASE_URL.should eq "http://api.rememberthemilk.com/services/rest/"
  end

end
