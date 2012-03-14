# encoding: utf-8
require 'spec_helper'

describe Linguo::Detect do
  describe "#detections" do
    context "with valid API key passed" do
      before do
        stub_request(:post, "http://ws.detectlanguage.com/0.2/detect").
          with(:body => {"q"=>"こんにちは", "key"=>"valid_api_key"}).
          to_return(:body => load_fixture("response"))
        @linguo = Linguo.detect('こんにちは', 'valid_api_key')
      end

      it "should request the correct resource" do
        a_request(:post, Linguo::Detect::API_URL).should have_been_made
      end

      it "should return the list of detections" do
        @linguo.detections.should be_an Array
        @linguo.detections.first.should be_a Hash
        @linguo.detections.first['language'].should == "ja"
      end
    end

    context "with invalid API key passed" do
      before do
        stub_request(:post, "http://ws.detectlanguage.com/0.2/detect").
          with(:body => {"q"=>"こんにちは", "key"=>""}).
          to_return(:body => load_fixture("wrong_api_key"))
      end

      it "should raise an API error" do
        expect { Linguo.detect('こんにちは', '') }.
          to raise_error Linguo::Errors::ApiError, "Invalid API key"
        a_request(:post, Linguo::Detect::API_URL).should have_been_made
      end
    end
  end
end
