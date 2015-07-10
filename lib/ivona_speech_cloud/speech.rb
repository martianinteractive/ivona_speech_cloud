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

    def uri
      "#{@client.endpoint}#{@path}"
    end

    def payload
      Payload.new(text, options).create
    end
  end
end
