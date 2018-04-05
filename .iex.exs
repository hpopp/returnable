defmodule What do
  import Returnable

  def thing do
    case :ok do
      :ok ->
        case 1234 do
          1234 -> :ok
          {:return, expr} -> expr
        end

      {:return, expr} ->
        expr
    end
  end

  def whatever do
    case :yeah do
      {:return, expr} -> expr
      item -> item
    end
  end

  def other_thing do
    with :ok <- :ok,
         :val <- :key do
      :yeah
    end
  end

  defr testing do
    1234

    if true do
      if true do
        return("cool")
      else
        :ignored
      end
    end

    return("bleh")
    :nope
  end
end

import Returnable

val =
  ret do
    if true, do: return("return early")
    :whatever

    if true do
      Enum.each(1..5, fn x ->
        if x == 3 do
          return(x)
        end
      end)
    else
      return("bleh")
    end

    return("yo")
    1234
    :trolol
  end

# IO.inspect(val, label: "Result")
