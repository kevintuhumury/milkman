require "spec_helper"

module Milkman
  describe Client do

    let(:options) do
      { api_key: "foo", shared_secret: "bar" }
    end

    context "#initialize" do

      it "saves a references to the specified options" do
        hash = { api_key: "foo", shared_secret: "bar", format: "json", perms: "delete" }

        client = described_class.new(options)
        expect(client.options).to eq hash
      end

      context "when the required API key and shared secret aren't specified" do

        before do
          options[:api_key]       = nil
          options[:shared_secret] = nil
        end

        it "raises a NoMilkError" do
          expect { described_class.new(options) }.to raise_error NoMilkError, "The API key and shared secret are required."
        end

      end

      context "when the API key is specified, but the shared secret isn't" do

        before { options[:shared_secret] = nil }

        it "raises a NoMilkError" do
          expect { described_class.new(options) }.to raise_error NoMilkError, "The API key and shared secret are required."
        end

      end

      context "when the API key isn't specified, but the shared secret is" do

        before { options[:api_key] = nil }

        it "raises a NoMilkError" do
          expect { described_class.new(options) }.to raise_error NoMilkError, "The API key and shared secret are required."
        end

      end

      context "when both the API key and shared secret are specified" do

        it "doesn't raise a NoMilkError" do
          expect { described_classClient.new(options) }.to_not raise_error NoMilkError
        end

      end

    end

    context "#get" do

      it "requests a call to the RTM API with the specified method" do
        expect(Milkman::Request).to receive(:call).with "http://api.rememberthemilk.com/services/rest/?api_key=foo&shared_secret=bar&perms=delete&format=json&method=method&api_sig=57c35d820267ab89717e291d619860d2"

        client = described_class.new(options)
        client.get "method"
      end
    end

  end
end
