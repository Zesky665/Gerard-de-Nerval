defmodule Gerard do
  use Application
  alias Alchemy.Client


  def start(_type, _args) do
    run = Client.start("YOUR_TOKEN_HERE")
    load_modules()
    use Haiku
    use Mod
    run
  end

  defp load_modules do
   use Gerard.Basic
   use Gerard.DnD
   use Gerard.Poll
   use Gerard.Stats
   use Gerard.Docs
   #use Gerard.DJ
   #use Viviani.About
  end
end
