require 'helper'

describe IvonaSpeechCloud::Speech do

  before do 
    stub_request(:post, "https://tts.us-east-1.ivonacloud.com/CreateSpeech").
         with(:body => "{\"Input\":{\"Data\":\"hello world!\"},\"OutputFormat\":{\"Codec\":\"MP3\",\"SampleRate\":22050},\"Parameters\":{\"Rate\":\"medium\",\"Volume\":\"medium\",\"SentenceBreak\":500,\"ParagraphBreak\":800},\"Voice\":{\"Name\":\"Salli\",\"Language\":\"en-US\",\"Gender\":\"Female\"}}").
         to_return(:status => 200, :body => "test", :headers => {})
  end

  let(:client) { client_instance }
  
  subject { IvonaSpeechCloud::Speech.new(client, "hello world!") }

  it { expect(subject.text).to eq "hello world!" }

  it { expect(subject.options).to eq Hash.new }

  context "#create" do
    it "returns an HTTParty response" do
      expect(subject.create.class).to eq HTTParty::Response
    end
  end

  it { expect(subject.uri).to eq "https://tts.us-east-1.ivonacloud.com/CreateSpeech" }

  context "#payload" do
    it "contains the input data" do
      json_payload = JSON(subject.payload)
      expect(json_payload["Input"]).to eq({"Data" => "hello world!"})
    end

    context "when initialized with options" do
      let(:speech_with_options) { IvonaSpeechCloud::Speech.new(client, "hello world!", {codec: "OGG"}) }
  
      it "sets the payload with the passed options" do
        json_payload = JSON(speech_with_options.payload)
        expect(json_payload["OutputFormat"]).to eq({"Codec" => "OGG", "SampleRate" => 22050})
      end
    end
  end

end
