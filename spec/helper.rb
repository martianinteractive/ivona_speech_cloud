require 'ivona_speech_cloud'
require 'rspec'
require 'webmock/rspec'
require 'pry'

WebMock.disable_net_connect!

def client_instance
  IvonaSpeechCloud::Client.new do |config|
    config.access_key = "YOUR-ACCESS-KEY"
    config.secret_key = "YOUR-SECRET-KEY"
    config.region = "us-east-1"
  end
end

def post
  stub_request(:post, "https://tts.us-east-1.ivonacloud.com/CreateSpeech").
  with(:body => "{\"Input\":{\"Data\":\"hello world!\"},\"OutputFormat\":{\"Codec\":\"MP3\",\"SampleRate\":22050},\"Parameters\":{\"Rate\":\"medium\",\"Volume\":\"medium\",\"SentenceBreak\":500,\"ParagraphBreak\":800},\"Voice\":{\"Name\":\"Salli\",\"Language\":\"en-US\",\"Gender\":\"Female\"}}",
       :headers => {'Authorization'=>'AWS4-HMAC-SHA256 Credential=YOUR-ACCESS-KEY/20150709/us-east-1/tts/aws4_request, SignedHeaders=content-type;host;x-amz-content-sha256;x-amz-date, Signature=4cb56dd89fc0e40d9074878648aca861bbfb0d8827decab5c820cdd0bee4099f', 'Content-Type'=>'application/json', 'Host'=>'tts.us-east-1.ivonacloud.com', 'X-Amz-Content-Sha256'=>'d7e92a9660998135c420afd4c95580101f8e70e43c37c1ff7d53a6edec1d6b63', 'X-Amz-Date'=>'20150709T233011Z'}).
  to_return(:status => 200, :body => "", :headers => {})
end
