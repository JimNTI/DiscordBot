require_relative 'spec_helper'
require_relative '../lib/info_command'

class TestInfoCommand < Minitest::Test

  def test_info_command_name_and_description
    command = InfoCommand.new

    assert_equal "!info", command.name
    assert_equal "Replies information about the Bot", command.description
  end

  def info_commands_responds_with_pong
    command = PingCommand.new
    mock_event = MockEvent.new(content: "!info")

    command.execute(mock_event)

    # Kontrollera att bot:en svarade
    assert_equal 1, mock_event.responses.length
    assert_equal "I'm a special Bot specialized in injecting people with superior happiness that nobody can replace", mock_event.responses.first
  end
end