module Generators
  class JiraGenerator < BasicGenerator
    protected

    def format(message)
      sender = message[:sender]
      body = message[:messages].map { |m| m[:body] }.join("\n")
      "*#{sender}:* #{body}"
    end
  end
end
