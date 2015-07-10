require 'helper'

describe IvonaSpeechCloud::SpeechInput do
  
  subject { IvonaSpeechCloud::SpeechInput.new("hello world!") }

  it { expect(subject.text).to eq "hello world!" }

  it { expect(subject.options).to eq Hash.new }

  describe "with options" do
    subject { IvonaSpeechCloud::SpeechInput.new("Hello world!", {codec: "OGG"}) }

    it { expect(subject.codec).to eq "OGG" }

    it { expect(subject.options).to eq({codec: "OGG"}) }

    it { expect(JSON(subject.params)["OutputFormat"]).to eq({
        "Codec" => "OGG", 
        "SampleRate" => 22050
        })
      }
  end
end
