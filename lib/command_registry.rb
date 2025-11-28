
class CommandRegistry
  def initialize
    @commands = {}
  end

  def register(command)
        @commands["!#{command.name}"] = command
  end
  def find(name)
    key = normalize_name(name)
    @commands[key]
  end
  def all
    @commands.values
  end

  private
  def normalize_name(name)
    name.strip.downcase
  end


end
