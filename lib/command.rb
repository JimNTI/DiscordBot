class Command
  def initialize(name:, description:)
    @name = name
    @description = description
  end

  attr_reader :name, :description

  def execute(event)
    # Basimplementation - subklasser override:ar denna
    raise NotImplementedError, "Subclass must implement execute method" #NYTT
  end
end