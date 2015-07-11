require 'helper'

describe IvonaSpeechCloud::Client do

  subject { client_instance }

  it { expect(subject.access_key).to eq "YOUR-ACCESS-KEY" }

  it { expect(subject.secret_key).to eq "YOUR-SECRET-KEY" }

  it { expect(subject.region).to eq "us-east-1" }

  it "returns the credentials" do 
    expect(subject.credentials).to eq ({
      access_key: "YOUR-ACCESS-KEY",
      secret_key: "YOUR-SECRET-KEY",
      region: "us-east-1"
    })
  end

  it { expect(subject.credentials?).to eq true }

  it { expect(subject.uri.host).to eq "tts.us-east-1.ivonacloud.com" }

  it { expect(subject.uri.path).to eq "" }

  it { expect(subject.endpoint).to eq "https://tts.us-east-1.ivonacloud.com" }

  it { expect(subject.host).to eq "tts.us-east-1.ivonacloud.com" }

  it { expect(subject.x_amz_date).to eq subject.date.strftime("%Y%m%dT%H%M%SZ") }

  it { expect(subject.content_type).to eq "application/json" }

  it { expect(subject.x_amz_content_sha256).to eq Digest::SHA256.new.update("").hexdigest }

  it { expect(subject.signer).to be_a AWS4::Signer }

  context "#headers" do

    it { expect(subject.headers["Content-Type"]).to eq 'application/json' }

    it { expect(subject.headers["Host"]).to eq subject.host }

    it { expect(subject.headers["X-Amz-Content-SHA256"]).to eq subject.x_amz_content_sha256 }

    it { expect(subject.headers["X-Amz-Date"]).to eq subject.x_amz_date }
    
  end

  context "#signed_headers" do
    it { expect(subject.signed_headers["Content-Type"]).to eq 'application/json' }

    it { expect(subject.signed_headers["Host"]).to eq subject.host }

    it { expect(subject.signed_headers["X-Amz-Content-SHA256"]).to eq subject.x_amz_content_sha256 }

    it { expect(subject.signed_headers["X-Amz-Date"]).to eq subject.x_amz_date }

    it { expect(subject.signed_headers.has_key?("Authorization")).to eq true }
  end

  context "#create_speech" do

    before {stub_create_speech_request}

    it { expect(subject.create_speech("hello world!").class.name).to eq "HTTParty::Response" }

    it "changes the path to /CreateSpeech" do
      expect { 
        subject.create_speech("hello world!")
        }.to change {subject.path }.from(nil).to('/CreateSpeech')
    end

    it "changes the body to a string representation of the JSON payload" do
      expect {
        subject.create_speech("hello world!")
      }.to change { subject.body }.from(nil).to("{\"Input\":{\"Data\":\"hello world!\"},\"OutputFormat\":{\"Codec\":\"MP3\",\"SampleRate\":22050},\"Parameters\":{\"Rate\":\"medium\",\"Volume\":\"medium\",\"SentenceBreak\":500,\"ParagraphBreak\":800},\"Voice\":{\"Name\":\"Salli\",\"Language\":\"en-US\",\"Gender\":\"Female\"}}")
    end

  end

  context "#create_speech with options" do
    before { stub_create_speech_request_with_options }

    it "modifies the request params with the specified options" do
      options = {:gender => "Male", :language => "es-ES", :voice_name => "Enrique"}

      expect(subject.create_speech("hola mundo!", options).class.name).to eq "HTTParty::Response"
    end
  end

end
