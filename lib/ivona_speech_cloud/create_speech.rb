module IvonaSpeechCloud
  class CreateSpeech
    attr_accessor :options

    include Runner

    # Initializes a new CreateSpeech object
    #
    # @param client [IvonaSpeechCloud::Client]
    # @param text [String]
    # @param options [Hash]
    # @return [IvonaSpeechCloud::CreateSpeech]
    def initialize(client, *options)
      @client = client
      @options = options
      @path = "/CreateSpeech"
    end

  end
end
