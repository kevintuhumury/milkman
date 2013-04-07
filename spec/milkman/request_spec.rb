require "spec_helper"

module Milkman
  describe Request do

    let(:url) { "#{BASE_URL}?foo=bar" }

    let(:response) do
      stub(code: 500, message: "Message", body: "Response Body", parsed_response: stub).as_null_object
    end

    before do
      described_class.stub(:get).and_return response
    end

    context ".call" do

      before { response.stub(:code).and_return 200 }

      it "calls parsed_response" do
        described_class.any_instance.should_receive(:parsed_response)
        described_class.call url
      end

      it "makes a call to the RTM API" do
        described_class.should_receive(:get).with url
        described_class.call url
      end

    end

    context "#parsed_response" do

      context "when the response is OK (code: 200)" do

        before { response.stub(:code).and_return 200 }

        it "parses the HTTParty response" do
          response.should_receive(:parsed_response)
          described_class.call url
        end

      end

      context "when the response isn't OK" do

        before { described_class.stub!(:code).and_return 500 }

        it "raises an InvalidResponseError" do
          expect { described_class.call(url) }.to raise_error InvalidResponseError
        end

        it "notifies the user with a formatted message" do
          expect { described_class.call(url) }.to raise_error InvalidResponseError, "Message (500): Response Body #{response.inspect}"
        end

      end

    end

  end
end