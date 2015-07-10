module IvonaSpeechCloud
  class ListVoices
    attr_accessor :options

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

    # Returns a list of available voices
    # 
    # @return [String]
    def run
      @client.path = @path
      @client.body = input
      perform_post
    end

    # @return [Hash]
    def input
      Input::ListVoices.new(options).params
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
