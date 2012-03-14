# encoding: utf-8
require 'spec_helper'

describe String do
  describe "#lang" do
    before do
      stub_request(:post, "http://ws.detectlanguage.com/0.2/detect").
        with(:body => {"q"=>"こんにちは", "key"=>"valid_api_key"}).
        to_return(:body => load_fixture("response"))
    end

    it "should return an array of detected languages" do
      'こんにちは'.lang.should == ["ja", "zh"]
    end
  end
end
