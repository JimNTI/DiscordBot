require_relative 'spec_helper'
require_relative '../lib/echo_command'

class TestEchoCommand < Minitest::Test

  def test_echo_returns_message_to_user
    command
    command = EchoCommand.new

    mock_event = MockEvent.new(content: "!echo yo what's up")
    command.execute(mock_event)

    response = mock_event("!echo", "").strip
  end
end
  