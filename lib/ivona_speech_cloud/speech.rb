module IvonaSpeechCloud
  class Speech
    attr_accessor :text, :options

    def initialize(client, text, options={})
      @client = client
      @text = text
      @options = options
      @path = "/CreateSpeech"
    end

    def create
      @client.path = @path
      @client.body = payload
      perform_post
    end

    def perform_post
      HTTParty.post(uri, body: payload, headers: @client.signed_headers)
    end

    end

    def gender
      @options.fetch(:gender, "female")
    end

  end
end
