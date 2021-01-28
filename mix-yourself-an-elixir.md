---
title: Mix Yourself an Elixir 101
author: Bart van Nierop
patat:
  incrementalLists: true
  eval:
    ex:
      command: ./myae lib/mix_yourself_an_elixir.ex
      fragment: false
      replace: true
    exs:
      command: ./myae test/mix_yourself_an_elixir_test.exs
      fragment: false
      replace: true
    elixir:
      command: iex -S mix
      fragment: true
      replace: false
    test:
      command: mix test || true
      fragment: true
      replace: false
...

```
 __  __ _       __   __                        _  __      _            _____ _ _      _
|  \/  (_)_  __ \ \ / /__  _   _ _ __ ___  ___| |/ _|    / \   _ __   | ____| (_)_  _(_)_ __
| |\/| | \ \/ /  \ V / _ \| | | | '__/ __|/ _ \ | |_    / _ \ | '_ \  |  _| | | \ \/ / | '__|
| |  | | |>  <    | | (_) | |_| | |  \__ \  __/ |  _|  / ___ \| | | | | |___| | |>  <| | |
|_|  |_|_/_/\_\   |_|\___/ \__,_|_|  |___/\___|_|_|   /_/   \_\_| |_| |_____|_|_/_/\_\_|_|
```

# Elixir (/ɪˈlɪksə/, /ɪˈlɪksɪə/ )

. . .

NOUN
##1. magical or medicinal potion.

‘an elixir guaranteed to induce love’

. . .

##2. particular type of medicinal solution.

‘a cough elixir’

. . .

##3. A programming language
Elixir is a dynamic, functional language designed for building scalable and
maintainable applications.

. . .

- 2011
- José Valim
- Erlang VM

- Scalable
- Fault-tolerant
- Immutable
- Extensible
- Interactive

# Mix (/mɪks/)

. . .

VERB
[WITH OBJECT]
##1. Combine or put together to form one substance or mass.

‘peppercorns are sometimes mixed with other spices’

. . .

##2. A build tool for the Elixir programming language

- Built-in build tasks
- Custom tasks
- Dependency management

# Experience
- Learning a different language every year
- Advent of Code to kick it off

. . .

## Not yet used

- OTP
- Phoenix

. . .

## Mix Yourself an Elixir 201
Soon&#8482;

. . .

## So what _can_ I talk about?

# Getting started

. . .

```sh
$ brew install elixir
$ mix new . --module MixYourselfAnElixir --app mix_yourself_an_elixir
```
. . .

```sh
* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating lib
* creating lib/mix_yourself_an_elixir.ex
* creating test
* creating test/test_helper.exs
* creating test/mix_yourself_an_elixir_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    mix test

Run "mix help" for more commands.
```

# Getting started

Let's fire up a REPL.
```sh
$ iex -S mix
```

```elixir
```

# Getting started

```elixir
h()
```

# Getting started

```elixir
h(v/0)
```

# Getting started
```elixir
File.write("hello.ex", """
  defmodule Hello do
    def world() do
      IO.puts "Hello, world!"
    end
  end
  """)
c("hello.ex")
Hello.world()
```

# Getting started
```elixir
File.write("hello.ex", '''
  defmodule Hello do
    @doc """
    Prints the string "Hello,world!" to stdout.
    """
    def world() do
      IO.puts "Hello, world!"
    end
  end
  ''')
c("hello.ex", ".")
h(Hello.world/0)
File.rm("Elixir.Hello.beam")
File.rm("hello.ex")
```

# Example: Fibonacci

A classic example.

. . .

`test/mix_yourself_an_elixir_test.exs:`
```exs
defmodule FibTest do
  use ExUnit.Case
  
  test "the zeroeth fibonacci number is 0" do
    assert Fib.get(0) == 0
  end
end

```

`lib/mix_yourself_an_elixir.ex:`
```ex
# Empty
 
```
. . .

```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  def get(n) do
  end
end

```
. . .
```test
$ mix test
```
# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  def get(n) do
    0
  end
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

We learnt that documentation is important in Elixir.

. . .

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  """
  def get(n) do
    0
  end
end

```
# Example: Fibonacci

We can do better.

. . .

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
  """
  def get(n) do
    0
  end
end

```
. . .

`test/mix_yourself_an_elixir_test.exs:`
```exs
defmodule FibTest do
  use ExUnit.Case
  doctest Fib # Magic

  test "the zeroeth fibonacci number is 0" do
    assert Fib.get(0) == 0
  end
end

```
. . .

```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      x -> {:error, x}
    end
  end
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
    
    iex> Fib.get(3)
    2
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      x -> {:error, x}
    end
  end
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
    
    iex> Fib.get(3)
    2
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      count -> get(0, 1, count - 2)
    end
  end

  defp get(a, b, count) do
    if count == 0 do
      a + b
    else
      get(b, a + b, count - 1)
    end
  end
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
    
    iex> Fib.get(3)
    2
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      count -> get(0, 1, count - 2)
    end
  end

  defp get(a, b, 0) do
    a + b
  end

  defp get(a, b, count) do
    get(b, a + b, count - 1)
  end
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
    
    iex> Fib.get(3)
    2
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      count -> get(0, 1, count - 2)
    end
  end

  defp get(a, b, 0), do: a + b
  defp get(a, b, count), do: get(b, a + b, count - 1)
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
    
    iex> Fib.get(3)
    2
    
    iex> Fib.get(-1)
    :error
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      count -> get(0, 1, count - 2)
    end
  end

  defp get(a, b, 0), do: a + b
  defp get(a, b, count), do: get(b, a + b, count - 1)
end

```
. . .
```
$ mix test
```
. . .

Infinite recursion...

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
    
    iex> Fib.get(3)
    2
    
    iex> Fib.get(-1)
    :error
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      count -> get(0, 1, count - 2)
    end
  end

  defp get(a, b, 0), do: a + b
  defp get(a, b, count) when count > 0, do: get(b, a + b, count - 1)
end

```
. . .
```test
$ mix test
```

# Example: Fibonacci

`lib/mix_yourself_an_elixir.ex:`
```ex
defmodule Fib do
  @doc """
  Returns the nth fibonacci number.
  
    iex> Fib.get(1)
    1
    
    iex> Fib.get(3)
    2
    
    iex> Fib.get(-1)
    :error
  """
  def get(n) do
    case n do
      0 -> 0
      1 -> 1
      count -> get(0, 1, count - 2)
    end
  end

  defp get(a, b, 0), do: a + b
  defp get(a, b, count) when count > 0, do: get(b, a + b, count - 1)
  defp get(a, b, count) when count < 0, do: :error
end

```
. . .
```test
$ mix test
```

<!-- # A more complex example: Timing -->

<!-- Comes built-in with Erlang. -->

<!-- ```elixir -->
<!-- {_duration, _result} = :timer.tc(fn -> Fib.get(100) end) -->
<!-- ``` -->
<!-- # A more complex example: Timing -->

<!-- It'd be a lot nicer without the anynonymous function. -->

<!-- . . . -->

<!-- ```elixir -->
<!-- defmodule Timing do -->
<!--   defmacro time(thing) do -->
<!--     quote do -->
<!--       :timer.tc(fn -> unquote(thing) end) -->
<!--     end -->
<!--   end -->
<!-- end -->

<!-- require Timing -->
<!-- Timing.time(Fib.get(100)) -->

<!-- ``` -->
<!-- # A more complex example: Timing -->

<!-- Quoting turns code into an AST. -->
<!-- ```elixir -->
<!-- f = quote do -->
<!--   a = 1 -->
<!-- end -->

<!-- f -->
<!-- ``` -->

<!-- . . . -->

<!-- Unquoting turns an AST into code. -->

<!-- ```elixir -->
<!-- f = quote do -->
<!--   a = 1 -->
<!-- end -->

<!-- g = quote do -->
<!--   unquote(f) -->
<!-- end -->

<!-- g -->
<!-- ``` -->

<!-- # A more complex example: Timing -->

<!-- Let's prove that it works as intended. -->

<!-- `lib/mix_yourself_an_elixir.ex:` -->
<!-- ```ex -->
<!-- defmodule Fib do -->
<!--   @doc """ -->
<!--   Returns the nth fibonacci number. -->
  
<!--     iex> Fib.get(1) -->
<!--     1 -->
    
<!--     iex> Fib.get(3) -->
<!--     2 -->
    
<!--     iex> Fib.get(-1) -->
<!--     :error -->
<!--   """ -->
<!--   def get(n) do -->
<!--     :timer.sleep(1000) # Now it's slow -->
<!--     case n do -->
<!--       0 -> 0 -->
<!--       1 -> 1 -->
<!--       count -> get(0, 1, count - 2) -->
<!--     end -->
<!--   end -->

<!--   def get(a, b, 0), do: a + b -->
<!--   def get(a, b, count) when count > 0, do: get(b, a + b, count - 1) -->
<!--   def get(a, b, count) when count < 0, do: :error -->
<!-- end -->

<!-- defmodule Timing do -->
<!--   defmacro time(thing) do -->
<!--     quote do -->
<!--       :timer.tc(fn -> unquote(thing) end) -->
<!--     end -->
<!--   end -->
<!-- end -->

<!-- ``` -->

<!-- # A more complex example: Timing -->
<!-- ```elixir -->
<!-- require Timing -->
<!-- Timing.time(Fib.get(100)) -->
<!-- ``` -->

#
```
 _____ _
|  ___(_)_ __
| |_  | | '_ \
|  _| | | | | |
|_|   |_|_| |_|
```
