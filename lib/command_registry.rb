
class CommandRegistry
  def initialize
    @commands
  end
  def register(command:)
    @commands = "!#{command.name}"
  end
  def find(name)
    normalized = name.start_with?("!") ? name[1..] : name
    @commands[normalized]
  end

end
