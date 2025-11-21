class EchoCommand
  attr_reader :name

  def initialize
    @name = "!echo"
  end

  def execute(event, text)
    if text.nil?  || text.empty?
      event.respond("Your message was empty")
    else
      event.respond(text)
    end
  end
end
