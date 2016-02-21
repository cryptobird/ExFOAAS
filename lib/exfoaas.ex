defmodule ExFOASS do
  @moduledoc """
  ExFOAAS brings FOAAS's utility in telling people to fuck off, to elixir.
  http://foaas.com/
  """
  @foaas "https://foaas.com"
  @atoms [:message, :subtitle]
  @paths_name_from ["shakespeare", "linus", "off", "you", "donut", "chainsaw", "outside", "madison", "nugget", "yoda", "bus", "shutup"]

  def request(opts) do
    HTTPoison.get!("#{@foaas}/#{Enum.join(opts, "/")}", [accept: "application/json"])
  end

  def handle_response(%{status_code: 200, body: body}) do
    Poison.decode! body
  end
  def handle_response(%{status_code: code, body: body}) do
    {code, Poison.decode!(body)}
  end

  def sanitize(json) do
    for {key, val} <- json, into: %{}, do: {String.to_existing_atom(key), val}
  end

  def process(response) do
    response
    |> handle_response
    |> sanitize
    |> insult_to_string
  end
  def random_insult(to, from) do
    [Enum.random(@paths_name_from), to, from]
    |> request
    |> process
  end

  def insult_to_string(insult), do: "#{insult.message} #{insult.subtitle}"

  def off(to, from),         do: process request(["off", to, from])
  def you(to, from),         do: process request(["you", to, from])
  def this(from),            do: process request(["this", from])
  def that(from),            do: process request(["that", from])
  def everything(from),      do: process request(["everything", from])
  def everyone(from),        do: process request(["everyone", from])
  def donut(to, from),       do: process request(["donut", to, from])
  def shakespeare(to, from), do: process request(["shakespeare", to, from])
  def linus(to, from),       do: process request(["linus", to, from])
  def king(to, from),        do: process request(["king", to, from])
  def pink(from),            do: process request(["pink", from])
  def life(from),            do: process request(["life", from])
  def chainsaw(to, from),    do: process request(["chainsaw", to, from])
  def outside(to, from),     do: process request(["outside", to, from])
  def thing(thing, from),    do: process request([thing, from])
  def thanks(from),          do: process request(["thanks", from])
  def flying(from),          do: process request(["flying", from])
  def fascinating(from),     do: process request(["fascinating", from])
  def madison(to, from),     do: process request(["madison", to, from])
  def cool(from),            do: process request(["cool", from])
  def field(to, from, ref),  do: process request(["field", to, from, ref])
  def nugget(to, from),      do: process request(["nugget", to, from])
  def yoda(to, from),        do: process request(["yoda", to, from])
  def ballmer(to, co, from), do: process request(["ballmer", to, co, from])
  def what(from),            do: process request(["what", from])
  def because(from),         do: process request(["because", from])
  def caniuse(tool, from),   do: process request(["caniuse", tool, from])
  def bye(from),             do: process request(["bye", from])
  def diabetes(from),        do: process request(["diabetes", from])
  def bus(to, from),         do: process request(["bus", to, from])
  def xmas(to, from),        do: process request(["xmas", to, from])
  def bday(to, from),        do: process request(["bday", to, from])
  def awesome(from),         do: process request(["awesome", from])
  def tucker(from),          do: process request(["tucker", from])
  def bucket(from),          do: process request(["bucket", from])
  def family(from),          do: process request(["family", from])
  def shutup(to, from),      do: process request(["shutup", to, from])
  def keepcalm(react, from), do: process request(["keepcalm", react, from])
  def dothing(act, ob, frm), do: process request(["dosomething", act, ob, frm])
  def thumbs(from),          do: process request(["thumbs", from])
  def tard(from),            do: process request(["retard", from])
end
