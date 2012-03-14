require 'spec_helper'

describe Linguo::Config do
  describe ".api_key" do
    it "should raise an error when api_key is not set" do
      expect { Linguo::Config.api_key }.
        to raise_error Linguo::Errors::MissingApiKey
    end

    it "should return an API key when api_key is set" do
      Linguo::Config.api_key = 'valid_api_key'
      Linguo::Config.api_key.should == 'valid_api_key'
    end
  end
end
