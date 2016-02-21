# ExFOASS

ExFOAAS brings the modernity and scalability of FOAAS(Fuck Off As A Service) to
to the elixir language. 

## Installation


  1. Add exfoaas to your list of dependencies in `mix.exs`:

        def deps do
          [{:exfoaas, "~> 0.0.1"}]
        end

  2. Ensure exfoaas is started before your application:

        def application do
          [applications: [:exfoaas]]
        end
