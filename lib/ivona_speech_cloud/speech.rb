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


    def codec
      @options.fetch(:codec, "MP3")
    end

    def sample_rate
      @options.fetch(:sample_rate, 22050)
    end

    def rate
      @options.fetch(:rate, "medium")
    end

    def volume
      @options.fetch(:volume, "medium")
    end

    def sentence_break
      @options.fetch(:sentence_break, 500)
    end

    def paragraph_break
      @options.fetch(:paragraph_break, 800)
    end

    def voice_name
      @options.fetch(:voice, "salli")
    end

    def language
      @options.fetch(:language, "en-US")
    end

    def gender
      @options.fetch(:gender, "female")
    end

  end
end
