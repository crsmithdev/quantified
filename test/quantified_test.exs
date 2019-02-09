defmodule QuantifiedTest do
  use ExUnit.Case
  doctest Quantified

  test "greets the world" do
    assert Quantified.hello() == :world
  end
end
