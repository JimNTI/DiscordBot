require 'discordrb'
require 'dotenv/load'
require_relative 'lib/text_command'
require_relative 'lib/dice_command'
require_relative 'lib/echo_command'
require_relative 'lib/help_command'
require_relative 'lib/command_registry'

# Hämta token från miljövariabel
token = ENV['DISCORD_BOT_TOKEN']

if token.nil? || token.empty?
  puts "❌ DISCORD_BOT_TOKEN är inte satt!"
  puts "Skapa en .env fil med: DISCORD_BOT_TOKEN=din_token"
  exit 1
end

# Skapa bot
bot = Discordrb::Bot.new(token: token,  intents: [:server_messages, :direct_messages])

registry = CommandRegistry.new

# Skapa kommando-instanser


# Enkla textkommandon - nu med TextCommand!
hello_command = TextCommand.new(
  name: "hello",
  description: "Says hello",
  text: "Hello!"
)

ping_command = TextCommand.new(
  name: "ping",
  description: "Pings",
  text: "Pong!"
)

# Bonus: Lägg till fler kommandon enkelt!
info_command = TextCommand.new(
  name: "info",
  description: "Shows bot info",
  text: "Hello I am Einar, I like Men"
)

skibidi_command = TextCommand.new(
  name: "skibidi",
  description: "Explains skibidi lore",
  text: "Alltså, lyssna här: Skibidi-toaletterna kom från ingenstans, okej? De bara dök upp och började sjunga “skibidi dop dop yes yes” medan de attackerade allt och alla. Dom är typ som onda porslinszombies men med autotune. Sen har du Camera-männen och TV-männen – det är våra hjältar, brorsan. Dom springer runt med kamerahuvuden och skjuter laser som om det vore helt normalt. Och mitt i allt det här är Titan Cameraman, värsta legenden, som försöker rädda mänskligheten från toaletterna. Det låter sjukt, jag vet – men det är så det är."
)


help_command = HelpCommand.new(registry: registry)

dice_command = DiceCommand.new
echo_command = EchoCommand.new


registry.register(hello_command)
registry.register(ping_command)
registry.register(info_command)
registry.register(dice_command)
registry.register(echo_command)
registry.register(help_command)
registry.register(skibidi_command)

# Hantera meddelanden
bot.message do |event|
  next if event.user.bot_account?

  content = event.content.strip
  parts = content.split
  command_name = parts[0].downcase  # "!hello", "!echo", etc.
  args = parts[1..] || []

  command = registry.find(command_name)
  next unless command

  if command.is_a?(EchoCommand) || command.is_a?(DiceCommand)
    command.execute(event, args.join(" "))
  else
    command.execute(event)
  end
end




end

# Logga när bot:en startar
bot.ready do
  puts "✅ Bot inloggad som: #{bot.profile.username}"
  puts "📡 Bot är online och lyssnar på kommandon!"
  puts "💬 Testa: !hello eller !ping"
end

# Starta bot:en
puts "🚀 Startar bot..."
bot.run