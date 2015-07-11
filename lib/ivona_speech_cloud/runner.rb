module IvonaSpeechCloud
  module Runner

    # @return [HTTParty::Response]
    def run
      @client.path = @path
      @client.body = input
      perform_post
    end

    # @return [Hash]
    def input
      @input ||= eval(input_class).new(options).params
    end

    # @return [String]
    def input_class
      caller = self.class.to_s.split("::").last
      @input_class = "Input::#{caller}"
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
