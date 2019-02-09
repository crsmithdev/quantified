FROM elixir:1.8.0

WORKDIR "/opt/app"

RUN mix local.hex --force && mix local.rebar --force

COPY . ./
RUN mix do deps.get, deps.compile, compile

CMD ["mix", "run", "--no-halt"]
