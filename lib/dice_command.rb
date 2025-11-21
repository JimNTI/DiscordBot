class DiceCommand
  attr_reader :name

  def initiliaze
    @name = "!dice"

  end

  def execute(event)
    event.respond("You rolled #{rand(1..6)}")
  end
end 