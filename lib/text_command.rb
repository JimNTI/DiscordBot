require_relative 'command'
require_relative '../lib/text_command'
require_relative '../lib/command'

class TextCommand < Command
  attr_reader :text
  def initialize(name:, description:, text:)
    super(name: name, description: description)
    @text = text
  end

  def execute(event)
    event.respond(@text)
  end


end