require "spec_helper"

module Milkman
  describe CLI do

    it "authorizes" do
      expect(Authorizer).to receive(:authorize).with(api_key: "foo", shared_secret: "bar")
      subject.authorize("foo", "bar")
    end

  end
end
