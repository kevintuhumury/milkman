require "spec_helper"

module Milkman
  describe Client do

    let(:options) do
      { api_key: "foo", shared_secret: "bar" }
    end

    context "#initialize" do
      let(:client) { described_class.new(options) }

      it "knows its shared secret" do
        expect(client.shared_secret).to eq "bar"
      end

      it "saves a references to the specified options" do
        hash = { api_key: "foo", format: "json", perms: "delete", v: 2 }

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
          expect { described_class.new(options) }.not_to raise_error
        end

      end

    end

    context "#get" do

      it "requests a call to the RTM API with the specified method" do
        expect(Milkman::Request).to receive(:call).with "http://api.rememberthemilk.com/services/rest/?api_key=foo&perms=delete&format=json&v=2&method=method&api_sig=095631780dd0429ec5a8389f89b97cb3"

        client = described_class.new(options)
        client.get "method"
      end
    end

  end
end
