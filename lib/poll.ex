defmodule Gerard.Poll do
  use Alchemy.Cogs, Genserver
  alias Alchemy.{Client, Cache, User, Embed, Reaction, Reaction.Emoji}
  import Embed
  #alias Viviani.Util.Time

  def fill_ballot(ballot,[],num) do
    {ballot, num}
  end

  def fill_ballot(ballot,[head|tail],num) do
    option = "#{num}. #{head}.\n "
    fill_ballot(ballot<>option,tail,num+1)
  end

  def create_ballot([head|tail],num) do
    ballot = "#{head} \n "
    fill_ballot(ballot,tail,num)
  end

  def reactions(num , msg) do
    case num do
      1 -> Alchemy.Client.add_reaction(msg, "1⃣")
      2 -> Alchemy.Client.add_reaction(msg, "2⃣")
      3 -> Alchemy.Client.add_reaction(msg, "3⃣")
      4 -> Alchemy.Client.add_reaction(msg, "4⃣")
      5 -> Alchemy.Client.add_reaction(msg, "5⃣")
      6 -> Alchemy.Client.add_reaction(msg, "6⃣")
      7 -> Alchemy.Client.add_reaction(msg, "7⃣")
      8 -> Alchemy.Client.add_reaction(msg, "8⃣")
      9 -> Alchemy.Client.add_reaction(msg, "9⃣")
      _ -> "Error"
    end
  end

  def add_reactions(message, x, 0) do
    {:ok}
  end

  def add_reactions(message, x, y) do

    reactions(x, message)
    add_reactions(message, x+1,y-1)
  end

  Cogs.set_parser(:poll, &List.wrap/1)
  Cogs.def poll(options) do


    {ballot, num}  = create_ballot(String.split(options,","),1)
    #Cogs.say ballot
    {:ok, messagee} = Alchemy.Client.send_message(message.channel_id, ballot)
    add_reactions(messagee, 1, num-1)
    #Alchemy.Client.add_reaction(messagee, "\u2764")
  end

  Cogs.def conclude do
    Cogs.say "pong!"
  end

end
