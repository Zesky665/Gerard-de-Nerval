defmodule Gerard.Docs do
  use Alchemy.Cogs
  use Alchemy.Events
  alias Alchemy.{Client, Cache, User, Embed}
  import Embed

  Cogs.def help do
    Cogs.say "In order to get help type the name of the relevant module with ? as a suffix.
              \nModules: \nBasic\nPoll\nStats\nDnD\nEx: !basic? "
  end

  Cogs.def basic? do
    Cogs.say "Basic: \nPing- play ping pong with Gerard\nme? - get to know Gerard\necho(str) - Repeat a word, that's it"
  end

  Cogs.def dnd? do
    Cogs.say "DnD: \nroll20 - doll a 20 sided die\nrollstats - roll stats for a dnd char\nroll(number of dice,die size,operator,modifier) - generic roll, leave space between values: \nEx: !roll 4 d6 + 5 "
  end

  Cogs.def poll? do
    Cogs.say "Poll: \npoll(Question, options) - Creates a poll, votes are cast via reactions.\nEx: !poll Does this work, Yes, It, Does"
  end

  Cogs.def stats? do
    Cogs.say "Stats: \ninfo - Outputs info about the bot\nstats - Outputs technical stats"
  end
end
