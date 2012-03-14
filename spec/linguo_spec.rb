require 'spec_helper'

describe Linguo do
  it { Linguo.should respond_to :detect }
  it { Linguo.should respond_to :api_key= }
end
