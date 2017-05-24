require "spec_helper"

describe Milkman do

  it "knows its AUTH_URL" do
    expect(Milkman::AUTH_URL).to eq "https://www.rememberthemilk.com/services/auth/"
  end

  it "knows its BASE_URL" do
    expect(Milkman::BASE_URL).to eq "http://api.rememberthemilk.com/services/rest/"
  end

end
