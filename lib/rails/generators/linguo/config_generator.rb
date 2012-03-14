module Linguo
  class ConfigGenerator < Rails::Generators::Base
    desc "Creates a configuration file at config/initializers/linguo.rb"

    # Creates a configuration file at <tt>config/initializers/linguo.rb</tt>
    # when running <tt>rails g linguo:config</tt>.
    def create_linguo_file
      create_file 'config/initializers/linguo.rb', "Linguo.api_key = ENV['LINGUO_API_KEY']"
    end
  end
end
