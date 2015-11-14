module Parsers
  class BasicParser
    attr_reader :content

    def initialize(content)
      @content = content
    end

    def joined_messages
      joined = []
      (messages || []).each do |item|
        if joined.empty? || joined.last[:sender] != item[:sender]
          joined << { sender: item[:sender], messages: [time_and_body(item)] }
        else
          joined.last[:messages] << time_and_body(item)
        end
      end
      joined
    end

    def messages
      raise NotImplementedError
    end

    def time_and_body(message)
      {
        time: message[:time],
        body: message[:body]
      }
    end
  end
end
