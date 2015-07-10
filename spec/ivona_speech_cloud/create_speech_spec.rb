require 'helper'

describe IvonaSpeechCloud::CreateSpeech do

  let(:client) { client_instance }
  
  subject { IvonaSpeechCloud::CreateSpeech.new(client, "hello world!") }

  it { expect(subject.text).to eq "hello world!" }

  it { expect(subject.options).to eq Hash.new }

  context "#create" do
    before { stub_create_speech_request }

    it "returns an HTTParty response" do
      expect(subject.run.class).to eq HTTParty::Response
    end
  end

  context "#input" do
    it "contains the input data" do
      json_input = JSON(subject.input)
      
      expect(json_input["Input"]).to eq({"Data" => "hello world!"})
    end

    context "when initialized with options" do
      let(:speech_with_options) { IvonaSpeechCloud::CreateSpeech.new(client, "hello world!", {codec: "OGG"}) }
  
      it "sets the input with the passed options" do
        json_input = JSON(speech_with_options.input)
        
        expect(json_input["OutputFormat"]).to eq({
          "Codec" => "OGG", 
          "SampleRate" => 22050
          })
      end
    end
  end

end
