require_relative 'spec_helper'
require_relative '../lib/command_registry'

class TestCommandRegistry < Minitest::Test
  def test_registry_can_be_created
    registry = CommandRegistry.new

    assert_instance_of CommandRegistry, registry
  end
  def test_can_find_registered_command
  registry = CommandRegistry.new
  command = TextCommand.new(name: "hello", description: "Says hello", text: "Hello!")
  registry.register(command)

  found = registry.find("!hello")

  assert_equal command, found
end
end