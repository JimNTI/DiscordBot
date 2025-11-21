class InfoCommand 
  attr_reader :name, :description

  def initialize
    @name = "!info"
    @description = "Replies information about the Bot"
  end

  def execute(event)
    event.respond("I'm a special Bot specialized in injecting people with superior happiness that nobody can replace")
  end
end