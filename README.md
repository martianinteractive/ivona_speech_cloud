# IvonaSpeechCloud

A Ruby client for Amazon's Text-to-Speech Service (Ivona Speech Cloud).

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
```

## Creating Speech Files

```
client.create_speech('Hello world!')
```

You can pass a hash of options as the second argument, i.e:

```ruby
client.create_speech('Hola mundo!', {language: "es-ES", gender: "Female", voice_name: "Conchita"})
```

## Listing voices

```ruby
client.list_voices
```

```
=> {"Voices"=>
  [{"Gender"=>"Female", "Language"=>"en-US", "Name"=>"Salli"},
   {"Gender"=>"Male", "Language"=>"en-US", "Name"=>"Joey"},
   {"Gender"=>"Male", "Language"=>"en-US", "Name"=>"Chipmunk"},
   {"Gender"=>"Male", "Language"=>"en-US", "Name"=>"Eric"},
   {"Gender"=>"Female", "Language"=>"en-US", "Name"=>"Ivy"},
   {"Gender"=>"Female", "Language"=>"en-US", "Name"=>"Jennifer"},
   {"Gender"=>"Male", "Language"=>"en-US", "Name"=>"Justin"},
   {"Gender"=>"Female", "Language"=>"en-US", "Name"=>"Kendra"},
   {"Gender"=>"Female", "Language"=>"en-US", "Name"=>"Kimberly"}]}
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ivona_speech_cloud/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
