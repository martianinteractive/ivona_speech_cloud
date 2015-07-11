module IvonaSpeechCloud
  class CreateSpeech
    attr_accessor :options

    include Runner

    # Initializes a new CreateSpeech object
    # options example: 
    # ["Hello world!"]
    # ["Hello world!", {:voice_name => "Joey"}]
    # ["Bonjour le monde", {:gender => "Female", :language => "fr-FR", :voice_name => "Celine"}]
    #
    # @param client [IvonaSpeechCloud::Client]
    # @param text [String]
    # @param options [Array]
    # @return [IvonaSpeechCloud::CreateSpeech]
    def initialize(client, options)
      @client = client
      @options = options
      @path = "/CreateSpeech"
    end

  end
end
