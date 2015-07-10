module IvonaSpeechCloud
  class Speech
    attr_accessor :text, :options

    # Initializes a new Speech object
    #
    # @param client [IvonaSpeechCloud::Client]
    # @param text [String]
    # @param options [Hash]
    # @return [IvonaSpeechCloud::Speech]
    def initialize(client, text, options={})
      @client = client
      @text = text
      @options = options
      @path = "/CreateSpeech"
    end

    # Returns the audio representation of the text
    # 
    # @return [String]
    def create
      @client.path = @path
      @client.body = payload
      perform_post
    end

    # @return [IvonaSpeechCloud::Payload]
    def payload
      Payload.new(text, options).create
    end

    private 

    # @return [HTTParty::Response]
    def perform_post
      post_options = {
        body: payload, 
        headers: @client.signed_headers
      }
      HTTParty.post(@client.uri, post_options)
    end
  end
end
