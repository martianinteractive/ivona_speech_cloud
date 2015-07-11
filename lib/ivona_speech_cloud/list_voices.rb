module IvonaSpeechCloud
  class ListVoices
    attr_accessor :options

    include Runner

    # Initializes a new Voice object
    #
    # @param client [IvonaSpeechCloud::Client]
    # @param options [Hash]
    # @return [IvonaSpeechCloud::Voice]
    def initialize(client, *options)
      @client = client
      @options = options
      @path = "/ListVoices"
    end

  end
end
