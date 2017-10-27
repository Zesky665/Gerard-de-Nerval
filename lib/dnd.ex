defmodule Gerard.DnD do
  use Alchemy.Cogs
  alias Alchemy.{Client, Cache, User, Embed}
  import Embed
  #alias Viviani.Util.Time

  Cogs.def roll20 do
    Cogs.say Enum.random(1..20)
  end

  def rollDie(dice, size) do
    Enum.random(dice..dice * size)
  end

  def rollStat do
    #  gen with rand, sort, remove smallest, sum
    Enum.random(3..18)
  end

  Cogs.def rollstats do

    str = rollStat()
    con = rollStat()
    dex = rollStat()
    int = rollStat()
    wis = rollStat()
    cha = rollStat()

    sum = Enum.sum([str,con,dex,int,wis,cha])

    Cogs.say "Str : #{str} \nCon : #{con} \nDex : #{dex} \nInt : #{int} \nWis : #{wis} \nCha : #{cha} \n\nSum : #{sum} "
  end

  Cogs.def roll(num, die, "+", mod) do
    die = String.replace(die, "d", " ") |> String.trim |> String.to_integer()
    mod = mod |> String.to_integer
    num = num |> String.to_integer
    IO.inspect num
    IO.inspect die
    IO.inspect "+"
    IO.inspect mod
    roll = rollDie(num,die)
    rez = roll + mod
    Cogs.say "#{roll} + #{mod} = #{rez}"
  end

  Cogs.def roll(num, die, "-", mod) do
    die = String.replace(die, "d", " ") |> String.trim |> String.to_integer()
    mod = mod |> String.to_integer
    num = num |> String.to_integer
    IO.inspect num
    IO.inspect die
    IO.inspect "+"
    IO.inspect mod
    roll = rollDie(num,die)
    rez = roll - mod
    Cogs.say "#{roll} - #{mod} = #{rez}"
  end

end
