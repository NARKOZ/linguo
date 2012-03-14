module Linguo
  # Defines methods to set API key.
  module Config
    def self.api_key=(val)
      @@api_key = val
    end

    def self.api_key
      begin
        @@api_key
      rescue NameError
        raise Linguo::Errors::MissingApiKey, "No API key has been set!"
      end
    end
  end
end
