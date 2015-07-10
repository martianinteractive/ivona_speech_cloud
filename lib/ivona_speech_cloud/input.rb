module IvonaSpeechCloud

  module Input

    DEFAULT = {
      :codec => "MP3",
      :sample_rate => 22050,
      :rate => "medium",
      :volume => "medium",
      :sentence_break => 500,
      :paragraph_break => 800,
      :voice_name => "Salli",
      :language => "en-US",
      :gender => "Female"
    }

    module CommonDefaults
      def language
        options.fetch(:language, DEFAULT[:language])
      end

      def gender
        options.fetch(:gender, DEFAULT[:gender])
      end
    end

    class CreateSpeech
      include CommonDefaults

      attr_accessor :text, :options

      def initialize(text, options={})
        @text = text
        @options = options
      end

      def params
        {
          "Input" => {
            "Data" => text
          },
          "OutputFormat" => {
            "Codec" => codec,
            "SampleRate" => sample_rate,
          },
          "Parameters" => {
            "Rate" => rate,
            "Volume" => volume,
            "SentenceBreak" => sentence_break,
            "ParagraphBreak" => paragraph_break
          },
          "Voice" => {
            "Name" => voice_name,
            "Language" => language,
            "Gender" => gender
          }
        }.to_json
      end

      def codec
        options.fetch(:codec, DEFAULT[:codec])
      end

      def sample_rate
        options.fetch(:sample_rate, DEFAULT[:sample_rate])
      end

      def rate
        options.fetch(:rate, DEFAULT[:rate])
      end

      def volume
        options.fetch(:volume, DEFAULT[:volume])
      end

      def sentence_break
        options.fetch(:sentence_break, DEFAULT[:sentence_break])
      end

      def paragraph_break
        options.fetch(:paragraph_break, DEFAULT[:paragraph_break])
      end

      def voice_name
        options.fetch(:voice, DEFAULT[:voice_name])
      end

    end

    class ListVoices
      attr_accessor :options

      include CommonDefaults

      def initialize(options={})
        @options = options
      end

      def params
        {
          "Voice" => {
            "Language" => language
          }.merge(options)
        }.to_json
      end
    end
  end
end
