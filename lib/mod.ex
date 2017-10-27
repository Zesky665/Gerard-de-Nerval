defmodule Mod do
  use Alchemy.Events

  Events.on_message(:inspect)

  def naughty_words?(message) do
    String.downcase(message) |> String.contains?( ["duck","kant","daisy","plow","didgeridoo"])
  end

  def inspect(message) do

    if(naughty_words?(message.content)) do
      ban
      #Alchemy.Client.delete_message(message)

      {:ok, user} = Alchemy.Client.get_user(message.author.id)
      {:ok, guild_id} = Alchemy.Cache.guild_id(message.channel_id)
      IO.inspect "Message.author.id = #{message.author.id}"
      IO.inspect user.id
      IO.inspect guild_id

      Alchemy.Client.kick_member(guild_id, message.author.id)
    end

  end

  def ban do
    IO.inspect "Some's gonna get kicked out (glances anrgily at #{})"
  end
end
#https://discord.gg/MFumKGb
