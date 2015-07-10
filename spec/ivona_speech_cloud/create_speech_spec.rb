require 'helper'

describe IvonaSpeechCloud::CreateSpeech do

  let(:client) { client_instance }
  
  subject { IvonaSpeechCloud::CreateSpeech.new(client, "hello world!") }

  it { expect(subject.text).to eq "hello world!" }

  it { expect(subject.options).to eq Hash.new }

  context "#create" do
    before { stubbed_request }

    it "returns an HTTParty response" do
      expect(subject.create.class).to eq HTTParty::Response
    end
  end

  context "#payload" do
    it "contains the input data" do
      json_payload = JSON(subject.payload)
      
      expect(json_payload["Input"]).to eq({"Data" => "hello world!"})
    end

    context "when initialized with options" do
      let(:speech_with_options) { IvonaSpeechCloud::CreateSpeech.new(client, "hello world!", {codec: "OGG"}) }
  
      it "sets the payload with the passed options" do
        json_payload = JSON(speech_with_options.payload)
        
        expect(json_payload["OutputFormat"]).to eq({
          "Codec" => "OGG", 
          "SampleRate" => 22050
          })
      end
    end
  end

end
