defmodule Returnable do
  @moduledoc """
  Documentation for Returnable.
  """

  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro return(expr) do
    quote do
      throw({unquote(__MODULE__), :return, unquote(expr)})
    end
  end

  # Strip off the nested do's
  defmacro ret(do: expr) do
    quote do
      Returnable.ret(unquote(expr))
    end
  end

  defmacro ret(expr) do
    quote do
      try do
        unquote(expr)
      catch
        :throw, {unquote(__MODULE__), :return, val} -> val
      end
    end
  end

  defmacro defr(call, expr) do
    quote do
      def unquote(call) do
        ret do
          unquote(expr)
        end
      end
    end
  end
end
