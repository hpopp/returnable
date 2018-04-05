defmodule ReturnableTest do
  use ExUnit.Case
  doctest Returnable

  use Returnable

  describe "return/1" do
    test "throws a return" do
      catch_throw(return(:cool))
    end
  end

  describe "ret/1" do
    test "returns early" do
      result =
        ret do
          _val = 1234
          return(:gucci)
          :more_statements
        end

      assert result == :gucci
    end

    test "returns first return statement" do
      result =
        ret do
          _val = 1234
          return(:gucci)
          return(:not_gucci)
          :more_statements
        end

      assert result == :gucci
    end

    test "returns last line if no return specified" do
      result =
        ret do
          _val = 1234
          :more_statements
        end

      assert result == :more_statements
    end
  end

  defr fun_that_returns_early(val) do
    return(val + 2)
    :this_should_not_be_returned
  end

  defr fun_but_without_a_return(val) do
    val + 2
  end

  defr call_one(x) do
    call_two(x)
  end

  defr call_two(x) do
    if x == 5, do: return(true)
    return(false)
  end

  describe "defr" do
    test "returns early" do
      assert fun_that_returns_early(2) == 4
    end

    test "works if no return statement defined" do
      assert fun_but_without_a_return(2) == 4
    end

    test "can call another returnable function" do
      assert call_one(5)
      refute call_one(6)
    end
  end
end
