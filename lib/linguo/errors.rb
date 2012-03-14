module Linguo
  module Errors
    # Custom error class for rescuing from all Linguo errors.
    class LinguoError < StandardError; end

    # Raised when Linguo API key is missed.
    class MissingApiKey < LinguoError; end

    # Raised when API endpoint returns error.
    class ApiError < LinguoError; end

    # Raised when API endpoint doesn't return the HTTP status code 200.
    class ApiConnectionError < LinguoError; end

    # Raised when API endpoint returns unexpected response.
    class UnexpectedApiException < LinguoError; end
  end
end
