defmodule Haiku do
  use Alchemy.Events

  Events.on_message(:haiku?)

  def inspect(message) do
    IO.inspect message.content
    me = message.author.id
    IO.inspect me
    IO.inspect message.author
    if me != "356812412378284033" do
      {:ok, message} = Alchemy.Client.send_message(message.channel_id, message.content)
    end
  end

  def count_syllables(msg) do
    #Regex.scan(~r/[aiouy]+e*|e(?!d$|ly).|[td]ed|le$/, msg) |> Enum.count()
    Regex.scan(~r/[aeiouy]+[^$e(,.:;!?)]/, msg) |> Enum.count()

  end

#  def form_haiku([head | tail], 5, haiku) do
#    IO.inspect haiku
#    syllable = count_syllables(head)
#    form_haiku(tail, 5 + syllable, haiku<>"\n"<>" "<>head)
#  end

#  def form_haiku([head | tail], 12, haiku) do
#    IO.inspect haiku
#    syllable = count_syllables(head)
#    form_haiku(tail, 12 + syllable, haiku<>"\n"<>" "<>head)
#  end

#  def form_haiku([head | tail], 16, haiku) do
#    IO.inspect haiku
#    form_haiku([], 17, haiku<>"\n"<>" "<>head)
#  end

  def form_haiku([], sc, haiku) do
    IO.inspect sc
    haiku
  end

  def form_haiku([head | tail], sc, haiku) do
    IO.inspect haiku
    IO.inspect sc
    syllable = count_syllables(head)

    if(sc < 5  &&  sc + syllable  >= 5) do
      form_haiku(tail, sc + syllable, haiku <> "\n" <> head)
    end

    if(sc < 12 && sc + syllable >= 12) do
      form_haiku(tail, sc + syllable, haiku <> "\n" <> head)
    end

    form_haiku(tail, sc + syllable, haiku <>" "<>head)

  end

  def haiku?(message) do

    sentences = String.split(message.content, [".", " ", "\n"])
    IO.inspect sentences

    sylab_count = count_syllables(message.content)
    IO.inspect sylab_count

    if ( 16 <= sylab_count && 18 >= sylab_count) do
      IO.inspect "This could be a haiku :P"
      unintentional_haiku = "Lookey here, you made an accidental haiku \n" <> form_haiku(sentences,1,"")
      IO.inspect form_haiku(sentences,0,"")
      {:ok, message} = Alchemy.Client.send_message(message.channel_id, unintentional_haiku)
    end

  end
end
