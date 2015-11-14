module Parsers
  class SkypeParser < BasicParser
    protected

    def split_pattern
      /(^\[[\/\:\d ]+\] [^\:]+\:\s+)/
    end

    def head_pattern
      /(^\[([\/\:\d ]+)\] ([^\:]+)\:\s+)/
    end

    def parse_message(message)
      head, body = message
      time, sender = head.match(HEAD_PATTERN)[2, 3]
      { sender: sender, time: time, body: body.strip }
    end
  end
end
