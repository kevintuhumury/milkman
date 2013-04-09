require "spec_helper"

class Klass
  # Dummy Class
end

module Milkman
  describe Utility do

    let(:klass) { Klass.new.extend Utility }

    let(:parameters) do
      { foo: "bar", baz: "qux"}
    end

    context "#sign" do

      subject { klass.sign "SECRET", parameters }

      it "adds an api_sig to the specified parameters" do
        parameters.should_not include(:api_sig)
        expect { subject }.to change { parameters.size }.from(2).to(3)
        parameters.should include(:api_sig)
      end

      it "calculates a MD5 hash of the formatted shared secret and specified parameters" do
        subject[:api_sig].should eq "e307a0ab45b29409338e21e33dd2cfca"
      end

    end

    context "#format" do

      it "sorts the specified parameters by key name, concatenates key value pairs and attaches it to the shared secret" do
        klass.format("SECRET", parameters).should eq "SECRETbazquxfoobar"
      end

    end

    context "#encode" do

      it "encodes the specified options to an url encoded string" do
        klass.encode(foo: "bar", baz: "qux").should eq "foo=bar&baz=qux"
      end

    end

    context "#request_url" do

      it "creates a request url with url encoded query parameters" do
        klass.request_url(foo: "bar", baz: "qux").should eq "http://api.rememberthemilk.com/services/rest/?foo=bar&baz=qux"
      end

    end

    context "#default_options" do

      it "knows its default API permissions" do
        klass.default_options[:perms].should eq "delete"
      end

      it "knows its default API response format" do
        klass.default_options[:format].should eq "json"
      end

    end

  end
end
