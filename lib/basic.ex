defmodule Gerard.Basic do
  use Alchemy.Cogs
  use Alchemy.Events
  alias Alchemy.{Client, Cache, User, Embed}
  import Embed
  require Logger
  #alias Viviani.Util.Time

  Cogs.def ping do
    Cogs.say "pong!"
    IO.puts "pong!"
  end

  Cogs.set_parser(:echo, &List.wrap/1)
  Cogs.def echo(name) do
    Cogs.say "Echo my name is #{name}"
  end

  Cogs.def me? do
    Cogs.say "I am Gerard de Bot the IIIth"
  end

end
