module Generators
  class GithubGenerator < BasicGenerator
    protected

    def format(message)
      sender = message[:sender]
      body = message[:messages].map { |m| m[:body] }.join("\n")
      "**#{sender}:** #{body}"
    end

    def splitter
      "\n\n"
    end
  end
end
