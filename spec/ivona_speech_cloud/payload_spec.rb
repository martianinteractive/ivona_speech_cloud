require 'helper'

describe IvonaSpeechCloud::Payload do
  
  subject { IvonaSpeechCloud::Payload.new("hello world!") }

  it { expect(subject.text).to eq "hello world!" }

  it { expect(subject.options).to eq Hash.new }
end
