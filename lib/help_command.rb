require_relative 'command'
require_relative 'command_registry'
require_relative 'text_command'



class HelpCommand < Command
  def initialize(registry:)
    super(name: "help", description: "Shows all available commands")
    @registry = registry
  end

    def execute(event)
      text = ""
      @registry.all.each do |command|
     text += "!#{command.name} - #{command.description}\n"

      end

      event.respond(text)
    end

end