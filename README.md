# IvonaSpeechCloud

A Ruby client for the Ivona Speech Cloud service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ivona_speech_cloud', github: "martianinteractive/ivona_speech_cloud"
```

And then execute:

    $ bundle

## Usage

```ruby
client = IvonaSpeechCloud::Client.new do |config|
  config.access_key = "YOUR-ACCESS-KEY"
  config.secret_key = "YOUR-SECRET-KEY"
  config.region = "us-east-1"
end

client.create_speech('Hello world!')

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ivona_speech_cloud/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
