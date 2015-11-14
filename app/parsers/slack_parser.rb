module Parsers
  class SlackParser < BasicParser
    SPLIT_PATTERN = %r(^([\w\-_\. ]+[\[\] \d:APM]+\s*$))
    HEADER_PATERN = /^(.*)\[([\d: APM]+)\]$/

    def messages
      parts = content.strip.split(SPLIT_PATTERN)[1..-1]
      ap parts
      # parts.each_slice(2).map { |p| parse_part(p) }
    end

    private

    def parse_part(part)
      # ap part
      # head, body = part
      # sender, time = HEADER_PATERN.match(head).to_a[1, 2]
      # { sender: sender, time: time, body: body.strip }
    end
  end
end
