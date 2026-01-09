require_relative 'spec_helper'
require_relative '../lib/help_command'
require_relative '../lib/command'
require_relative '../lib/command_registry'

class TestHelpCommand < Minitest::Test
  def test_help_command_can_be_created
    registry = CommandRegistry.new
    command = HelpCommand.new(registry: registry)

    assert_instance_of HelpCommand, command
    assert_kind_of Command, command
    assert_equal "help", command.name
  end

  def test_help_command_lists_all_commands
  registry = CommandRegistry.new
  hello = TextCommand.new(name: "hello", description: "Says hello", text: "Hello!")
  ping = TextCommand.new(name: "ping", description: "Pings bot", text: "Pong!")

  registry.register(hello)
  registry.register(ping)

  help_command = HelpCommand.new(registry: registry)
  mock_event = MockEvent.new

  help_command.execute(mock_event)

  response = mock_event.responses.first

  # Verifiera att responsen innehåller alla kommandon
  assert_includes response, "!hello"
  assert_includes response, "Says hello"
  assert_includes response, "!ping"
  assert_includes response, "Pings bot"
end
end