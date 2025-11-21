require_relative 'spec_helper'
require_relative '../lib/ping_command'

class TestPingCommand < Minitest::Test

  def test_ping_command_name_and_description
    command = PingCommand.new

    assert_equal "!ping", command.name
    assert_equal "Replies with Pong!", command.description
  end

  def test_commands_responds_with_pong
    command = PingCommand.new
    mock_event = MockEvent.new(content: "!ping")

    command.execute(mock_event)

    # Kontrollera att bot:en svarade
    assert_equal 1, mock_event.responses.length
    assert_equal "Pong!", mock_event.responses.first
  end
end