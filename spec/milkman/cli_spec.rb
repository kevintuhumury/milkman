require "spec_helper"

module Milkman
  describe CLI do

    it "authorizes" do
      Authorizer.should_receive(:authorize).with(api_key: "foo", shared_secret: "bar")
      subject.authorize("foo", "bar")
    end

  end
end
