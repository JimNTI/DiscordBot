require 'discordrb'
require 'dotenv/load'
require_relative 'lib/text_command'
require_relative 'lib/dice_command'
require_relative 'lib/echo_command'
# Hämta token från miljövariabel
token = ENV['DISCORD_BOT_TOKEN']

if token.nil? || token.empty?
  puts "❌ DISCORD_BOT_TOKEN är inte satt!"
  puts "Skapa en .env fil med: DISCORD_BOT_TOKEN=din_token"
  exit 1
end

# Skapa bot
bot = Discordrb::Bot.new(token: token,  intents: [:server_messages])

# Skapa kommando-instanser
dice_command = DiceCommand.new
echo_command = EchoCommand.new

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


# Hantera meddelanden
bot.message do |event|
  # Ignorera bot:ens egna meddelanden
  next if event.user.bot_account?

  content = event.content.strip.downcase

  # Kolla om meddelandet är ett kommando
  case content
  when "!hello"
    hello_command.execute(event)
  when "!ping"
    ping_command.execute(event)
  when "!info"
    info_command.execute(event)
  when "!dice"
    dice_command.execute(event)
  when /^!echo/
  text = content.sub("!echo", "").strip
  echo_command.execute(event, text)
  when "skibidi"
    skibidi_command.execute(event)
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