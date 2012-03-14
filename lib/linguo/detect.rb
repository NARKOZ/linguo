module Linguo
  class Detect
    # The URL to the API endpoint.
    API_URL = 'http://ws.detectlanguage.com/0.2/detect'

    # An array of detections.
    attr_reader :detections

    # Initializes a new Detect object and parses the API response.
    #
    # @param  [String] text The text required to detect.
    # @param  [String] api_key The API key obtained from detectlanguage.com.
    # @return [Linguo::Detect]
    def initialize(text, api_key)
      raise Errors::MissingApiKey, "No API key provided." unless api_key

      uri = URI API_URL
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data('q' => text, 'key' => api_key)
      res = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(req)}

      if res.code.to_i == 200
        data = JSON.parse(res.body)
        raise Errors::ApiError, data['error']['message'] if data['error']
        raise Errors::UnexpectedApiException if data['data'].nil?
        @detections = data['data']['detections']
      else
        raise Errors::ApiConnectionError, "#{response.code} #{response.message}"
      end
    end
  end
end
