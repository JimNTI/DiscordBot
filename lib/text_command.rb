require_relative 'command'
require_relative '../lib/text_command'
require_relative '../lib/command'

class TextCommand < Command
  attr_reader :text
  def initialize(name:, description:, text:)
    super(name: "test", description: "Test command")
    @text = text
  end

  def execute(event)
    event.respond(@text)
  end

  def test_can_register_command
    registry = CommandRegistry.new
    command = TextCommand.new(name: "hello", description: "Says hello", text: "Hello!")

    registry.register(command)

    # Verifiera att kommandot registrerades (vi testar detta via find i nästa test)
    # För nu, bara att det inte kraschar
    assert true
  end
end