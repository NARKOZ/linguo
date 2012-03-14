require 'linguo/version'
require 'linguo/config'
require 'linguo/detect'
require 'linguo/errors'
require 'linguo/core_ext/string'
require 'net/http'
require 'json'

module Linguo
  # Sets API key obtained from detectlanguage.com.
  #
  # @see Linguo::Config
  def self.api_key=(val)
    Config.api_key = val
  end

  # Creates a new instance of Linguo::Detect.
  #
  # Note that api_key is optional and isn't required once you set
  # <tt>Linguo::Config.api_key</tt> or <tt>ENV['LINGUO_API_KEY']</tt>.
  #
  # @param  [String] text The text required to detect.
  # @param  [String] api_key The API key obtained from detectlanguage.com.
  # @return [Linguo::Detect]
  def self.detect(text, api_key=nil)
    api_key = api_key || Linguo::Config.api_key || ENV['LINGUO_API_KEY']
    Detect.new(text, api_key)
  end
end
