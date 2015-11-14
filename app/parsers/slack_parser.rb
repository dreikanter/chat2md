module Parsers
  class SlackParser < BasicParser
    protected

    def split_pattern
      /(^[\w\-_\. ]+\[\d\d?:\d\d(?:[ APM]{3})\]\s*$)/
    end

    def header_pattern
      /^([\w\-_\. ]+)\[(\d\d?:\d\d(?:[ APM]{3}))\]\s*$/
    end

    def parse_message(message)
      head, body = message
      sender, time = header_pattern.match(head).to_a[1, 2]
      body = drop_timestamps(body.to_s.strip)
      { sender: sender.to_s.strip, time: time.to_s.strip, body: body }
    end

    def drop_timestamps(text)
      text.gsub(/\[\d\d?:\d\d[ APM]*\]\s*/, '').gsub(/\n+/, "\n")
    end
  end
end
