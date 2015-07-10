module IvonaSpeechCloud
  class CreateSpeech
    attr_accessor :text, :options

    # Initializes a new CreateSpeech object
    #
    # @param client [IvonaSpeechCloud::Client]
    # @param text [String]
    # @param options [Hash]
    # @return [IvonaSpeechCloud::CreateSpeech]
    def initialize(client, text, options={})
      @client = client
      @text = text
      @options = options
      @path = "/CreateSpeech"
    end

    # Returns the audio representation of the text
    # 
    # @return [String]
    def run
      @client.path = @path
      @client.body = input
      perform_post
    end

    # @return [Hash]
    def input
      SpeechInput.new(text, options).params
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
