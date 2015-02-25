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
        expect(parameters).not_to include(:api_sig)
        expect { subject }.to change { parameters.size }.from(2).to(3)
        expect(parameters).to include(:api_sig)
      end

      it "calculates a MD5 hash of the formatted shared secret and specified parameters" do
        expect(subject[:api_sig]).to eq "e307a0ab45b29409338e21e33dd2cfca"
      end

    end

    context "#format" do

      it "sorts the specified parameters by key name, concatenates key value pairs and attaches it to the shared secret" do
        expect(klass.format("SECRET", parameters)).to eq "SECRETbazquxfoobar"
      end

    end

    context "#encode" do

      it "encodes the specified options to an url encoded string" do
        expect(klass.encode(foo: "bar", baz: "qux")).to eq "foo=bar&baz=qux"
      end

    end

    context "#request_url" do

      it "creates a request url with url encoded query parameters" do
        expect(klass.request_url(foo: "bar", baz: "qux")).to eq "http://api.rememberthemilk.com/services/rest/?foo=bar&baz=qux"
      end

    end

    context "#default_options" do

      it "knows its default API permissions" do
        expect(klass.default_options[:perms]).to eq "delete"
      end

      it "knows its default API response format" do
        expect(klass.default_options[:format]).to eq "json"
      end

    end

  end
end
