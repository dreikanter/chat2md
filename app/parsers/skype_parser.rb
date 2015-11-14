module Parsers
  class SkypeParser < BasicParser
    SPLIT_PATTERN = /(^\[[\/\:\d ]+\] [^\:]+\:\s+)/
    HEAD_PATTERN = /(^\[([\/\:\d ]+)\] ([^\:]+)\:\s+)/

    def messages
      parts = content.strip.split(SPLIT_PATTERN)[1..-1].to_a
      parts.each_slice(2).map { |m| parse_message(m) }
    end

    private

    def parse_message(message)
      head, body = message
      time, sender = head.match(HEAD_PATTERN)[2, 3]
      { sender: sender, time: time, body: body.strip }
    end
  end
end
