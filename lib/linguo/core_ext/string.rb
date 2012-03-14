class String
  # Retrieves all the languages detected for the current string
  # sorted by confidence.
  #
  # Requires <tt>Linguo::Config.api_key</tt> or <tt>ENV['LINGUO_API_KEY']</tt>
  # to be set up.
  #
  # @example
  #  "simple text".lang # => ["en", "fr"]
  # @return [Array]
  def lang
    l ||= Linguo.detect(self, Linguo::Config.api_key)
    l.detections.map {|x| x['language']}
  rescue => e
    raise Linguo::Errors::LinguoError, e.message
  end
end
