class ChatConverter
  FROM = %w(slack skype)
  TO = %w(github jira)

  def self.convert(from, to, content)
    raise ArgumentError unless FROM.include?(from) && TO.include?(to)
    parser = namespaced_class(Parsers, "#{from}_parser")
    generator = namespaced_class(Generators, "#{to}_generator")
    generator.new(parser.new(content).joined_messages).content
  end

  def self.classify(str)
    str.split('_').map(&:capitalize).join
  end

  def self.namespaced_class(space_name, class_name)
    eval([space_name, classify(class_name)].map(&:to_s).join('::'))
  end
end
