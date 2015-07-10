require 'aws4'
require 'httparty'

module IvonaSpeechCloud
  class Client
    attr_accessor :access_key, :secret_key, :region, :body, :path
    
    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [IvonaSpeechCloud::Client]
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      yield(self) if block_given?
    end

    def create_speech(text, options={})
      speech(text, options).create
    end

    def speech(text, options)
      Speech.new(self, text, options)
    end

    # @return [Hash]
    def credentials
      {
        access_key: access_key,
        secret_key: secret_key,
        region: region
      }
    end

    # @return URI::HTTPS
    def uri
      @uri = begin
        uri = URI(endpoint)
        uri.path = path if path
        uri
      end
    end

    def endpoint
      "https://#{host}"
    end

    def host
      "tts.#{region}.ivonacloud.com"
    end

    def x_amz_date
      date.strftime("%Y%m%dT%H%M%SZ")
    end

    def date
      @date ||= Time.now.utc
    end

    def x_amz_content_sha256(body="")
      Digest::SHA256.new.update(body).hexdigest
    end

    def content_type
      "application/json"
    end

    def signed_headers
      signer.sign("POST", uri, headers, body)
    end

    def signer
      @signer ||= AWS4::Signer.new(credentials)
    end

    def headers
      @headers ||= {
        "Content-Type" => content_type,
        "Host" => host,
        "X-Amz-Content-SHA256" => x_amz_content_sha256,
        "X-Amz-Date" => x_amz_date
      }
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end
  end
end
