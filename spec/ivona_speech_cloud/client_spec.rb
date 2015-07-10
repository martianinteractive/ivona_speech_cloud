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

  context "#speech" do
    it { expect(subject.speech("hello world!", {})).to be_a IvonaSpeechCloud::Speech }

    it { expect(subject.speech("hello world!", {}).options).to eq({}) }

    it { expect(subject.speech("hello world!", {codec: "OGG"}).options).to eq({codec: "OGG"}) }

  end

end
