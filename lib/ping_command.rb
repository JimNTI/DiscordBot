class PingCommand
  attr_reader :name, :description

  def initialize
    @name = "!ping"
    @description = "Replies with Pong!"
  end

  def execute(event)
    event.respond("Pong!")
  end
end
