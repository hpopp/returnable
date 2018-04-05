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
  end

  defr fun_that_returns_early(val) do
    return(val + 2)
    :this_should_not_be_returned
  end

  describe "defr" do
    test "returns early" do
      assert fun_that_returns_early(2) == 4
    end
  end
end
