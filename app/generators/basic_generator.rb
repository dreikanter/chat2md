module Generators
  class BasicGenerator
    attr_reader :messages

    def initialize(messages)
      @messages = messages
    end

    def content
      messages.map { |m| format(m) }.join(splitter)
    end

    protected

    def format(message)
      raise NotImplementedError
    end

    def splitter
      "\n\n"
    end
  end
end
