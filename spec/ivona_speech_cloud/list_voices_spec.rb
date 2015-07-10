require 'helper'

describe IvonaSpeechCloud::ListVoices do

  let(:client) { client_instance }
  
  subject { IvonaSpeechCloud::ListVoices.new(client) }

  it { expect(subject.options).to eq Hash.new }

  context "#create" do
    before { stub_list_voices_request }

    it "returns an HTTParty response" do
      expect(subject.run.class).to eq HTTParty::Response
    end
  end

  context "#input" do
    it "contains the input data" do
      json_input = JSON(subject.input)
      
      expect(json_input["Voice"]).to eq({"Language" => "en-US"})
    end

    context "with explict language option" do
      subject { IvonaSpeechCloud::ListVoices.new(client, {:Language => "es-ES"}) }

      it "" do
        json_input = JSON(subject.input)

        expect(json_input["Voice"]).to eq({"Language" => "es-ES"})
      end
    end
  end
end
