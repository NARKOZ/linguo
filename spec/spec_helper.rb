require 'rspec'
require 'linguo'
require 'webmock/rspec'

def load_fixture(name)
  File.new(File.dirname(__FILE__) + "/fixtures/#{name}.json")
end
