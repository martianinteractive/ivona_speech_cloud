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

def stub_create_speech_request
  stub_request(:post, "https://tts.us-east-1.ivonacloud.com/CreateSpeech").
  with(:body => "{\"Input\":{\"Data\":\"hello world!\"},\"OutputFormat\":{\"Codec\":\"MP3\",\"SampleRate\":22050},\"Parameters\":{\"Rate\":\"medium\",\"Volume\":\"medium\",\"SentenceBreak\":500,\"ParagraphBreak\":800},\"Voice\":{\"Name\":\"Salli\",\"Language\":\"en-US\",\"Gender\":\"Female\"}}").
  to_return(:status => 200, :body => "", :headers => {})
end

def stub_list_voices_request
  stub_request(:post, "https://tts.us-east-1.ivonacloud.com/ListVoices").
  with(:body => "{\"Voice\":{\"Language\":\"en-US\"}}").
  to_return(:status => 200, :body => "", :headers => {})
end

def stub_create_speech_request_with_options
  stub_request(:post, "https://tts.us-east-1.ivonacloud.com/CreateSpeech").
  with(:body => "{\"Input\":{\"Data\":\"hola mundo!\"},\"OutputFormat\":{\"Codec\":\"MP3\",\"SampleRate\":22050},\"Parameters\":{\"Rate\":\"medium\",\"Volume\":\"medium\",\"SentenceBreak\":500,\"ParagraphBreak\":800},\"Voice\":{\"Name\":\"Enrique\",\"Language\":\"es-ES\",\"Gender\":\"Male\"}}").
  to_return(:status => 200, :body => "", :headers => {})
end
