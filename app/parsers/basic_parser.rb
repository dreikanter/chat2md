module Parsers
  class BasicParser
    attr_reader :content

    def initialize(content)
      @content = content
    end

    def messages
      joined = []
      (raw_messages || []).each do |item|
        if joined.empty? || joined.last[:sender] != item[:sender]
          joined << { sender: item[:sender], messages: [time_and_body(item)] }
        else
          joined.last[:messages] << time_and_body(item)
        end
      end
      joined
    end

    protected

    def split_pattern
      raise NotImplementedError
    end

    def raw_messages
      parts = content.strip.split(split_pattern)[1..-1].to_a
      parts.each_slice(2).map { |m| parse_message(m) }
    end

    def time_and_body(message)
      {
        time: message[:time],
        body: message[:body]
      }
    end
  end
end
