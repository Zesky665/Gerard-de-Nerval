#defmodule Gerard.DJ do

#  use Alchemy.Cogs
#  use Alchemy.Events
#  alias Alchemy.{Client, Cache, User, Embed, Voice}

#  Cogs.def play(url) do
#    {:ok, guild} = Cogs.guild()
#    some_voice_channel = Enum.find(guild.channels, &match?(%{type: 2}, &1))
    # joins the default channel for this guild
    # this will check if a connection already exists for you
#    Alchemy.Voice.join(guild.id, some_voice_channel.id)
#    Alchemy.Voice.play_url(guild.id, url)

#  end

#  Cogs.def join_voice do
#    {:ok, guild} = Cogs.guild()
#    some_voice_channel = Enum.find(guild.channels, &match?(%{type: 2}, &1))

#    Alchemy.Voice.join(guild.id, some_voice_channel.id)
#    Cogs.say "Done"
#  end

#  Cogs.def test do
#    {:ok, guild} = Cogs.guild()
#    voice_channels = Enum.find(guild.channels,
#    IO.inspect voice_channels
#  end
#end
