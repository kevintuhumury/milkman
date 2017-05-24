require "spec_helper"

module Milkman
  describe Authorizer do

    let(:options) do
      { api_key: "<api_key>", shared_secret: "<shared_secret>" }
    end

    context "#initialize" do
      let(:client) { described_class.new(options) }

      it "knows its shared secret" do
        expect(client.shared_secret).to eq "<shared_secret>"
      end

      it "saves a references to the specified options" do
        hash = { api_key: "<api_key>", format: "json", perms: "delete", v: 2 }
        expect(client.options).to eq hash
      end

    end

    context ".authorize" do

      it "authorizes" do
        expect_any_instance_of(described_class).to receive(:authorize)
        described_class.authorize options
      end

    end

    context "#authorize" do

      let(:output) do
        capture_stdout { described_class.authorize options }
      end

      let(:response) do
        {"rsp" => {"auth" => {"user" => {"username" => "<username>"}, "token" => "<token>"}}}
      end

      before { allow(STDIN).to receive(:gets).and_return "<frob>" }

      it "makes a call to the RTM API" do
        allow(Milkman::Request).to receive(:call).with(any_args).and_return response
        capture_stdout { described_class.authorize options }
      end

      context "output" do

        before do
          allow(Milkman::Request).to receive(:call).with(any_args).and_return response
        end

        it "notifies the user of entering the frob value" do
          allow_any_instance_of(described_class).to receive(:frob_message_url).and_return "<url>"
          expect(output).to include "\nCopy the URL below and follow the steps on Remember The Milk (RTM) to authorize Milkman:\n\n<url>\n\nOnce you've authorized Milkman, you'll receive a hash called 'frob' from Remember The Milk. The page from Remember The Milk will list something like the following: 'No callback URL specified for this API key. Your frob value is YOUR_FROB'. Copy and paste that YOUR_FROB value below and press <enter>:"
        end

        it "notifies the user of the received auth token, API key and shared secret" do
          expect(output).to include "<username>, you've successfully authorized Milkman with Remember The Milk. As you can see we've received your username and an authorization token. Both this auth token, your API key and shared secret should be saved for later use. You can either save them in a YAML file and load them in your application, include them in the Ruby script where you're using this gem or set them as environment variables. That's completely up to you.\n\nBoth the auth token, API key and shared secret are listed below. Save them using one of the methods above (or perhaps another solution) as you'll need all of them to use Milkman in your own project. Oh, and Remember... The Milk!\n\n\tapi_key:       <api_key>\n\tshared_secret: <shared_secret>\n\tauth_token:    <token>"
        end

      end

    end

  end
end
