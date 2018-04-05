# Returnable

Return statement for Elixir.

> This package is written by professionals. Don't try this at home.

## Installation

Add `returnable` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:returnable, github: "hpopp/returnable"}
  ]
end
```

## Quickstart Example
It's so easy to get started you'll feel dumber using it.

```elixir
defmodule YourModule do
  use Returnable
  
  defr sample_fun(x) do
    if x == 5 do
      return :awesome
    end
    
    x + 5
  end
end

iex> YourModule.sample_fun(5)
:awesome
iex> YourModule.sample_fun(7)
12
```

This package allows you to write really terrible code like:

```elixir
def fetch_active_user(id) do
  if User.admin?(id) do
    return nil
  else
    if User.active?(id) do
      return User.fetch(id)
    end
  end
  return nil # Not necessary, but probably makes you feel warm and fuzzy
end
```

Having trouble with `Enum` functions? No worries, you don't need to understand them anymore.

```elixir
def fetch_user(users, id) do
  for user <- users do
    if user.id == id, do: return user
  end
end
```
