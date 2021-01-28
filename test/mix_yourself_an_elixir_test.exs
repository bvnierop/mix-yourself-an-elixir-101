defmodule MixYourselfAnElixirTest do
  use ExUnit.Case
  doctest MixYourselfAnElixir

  test "greets the world" do
    assert MixYourselfAnElixir.hello() == :world
  end
end
