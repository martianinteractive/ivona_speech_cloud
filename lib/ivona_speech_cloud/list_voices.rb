module IvonaSpeechCloud
  class ListVoices
    attr_accessor :language, :gender

    # Initializes a new Voice object
    #
    # @param client [IvonaSpeechCloud::Client]
    # @param options [Hash]
    # @return [IvonaSpeechCloud::Voice]
    def initialize(client, options={})
      @client = client
      @options = options
      @path = "/ListVoices"
    end

    # Returns the audio representation of the text
    # 
    # @return [String]
    def run
      @client.path = @path
      @client.body = payload
      perform_post
    end

    # @return [Hash]
    def input
      SpeechInput.new(options).params
    end

    private 

    # @return [HTTParty::Response]
    def perform_post
      post_options = {
        body: input, 
        headers: @client.signed_headers
      }
      HTTParty.post(@client.uri, post_options)
    end
  end
end
