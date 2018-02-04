# attribution 
# https://elixirschool.com/en/lessons/basics/control-structures/
# https://forums.pragprog.com/forums/322/topics/11942
# http://www.ccs.neu.edu/home/ntuck/courses/2018/01/cs4550/notes/07-elixir/rw.exs
# https://github.com/kcurtin/calculator

defmodule Calc do

  def main() do
    case IO.gets("Enter the equation: ") do
      :eof ->
        IO.puts "Finish"
      {:error, reason} ->
        IO.puts "Error: #{reason}"
      line ->
        IO.puts(eval(line))
        main()
    end
  end

  def eval(equation) do
    "(#{equation})"
    |> String.replace(" ", "")
    |> calculate(:found)
  end

  defp calculate(equation, type) do
    cond do
      type == :not_found -> equation
      type == :found -> calculate(evaluate_equation(equation), pattern(~r/\(([^()]+)\)/, equation))
    end
  end


  defp eval_operation(eq, op, :proceed) do
    { _ , re_exp} = Regex.compile("(\\d+)(\\#{op})(\\d+)")
    eval_operation(eq, op, pattern(re_exp, eq))
  end


  defp eval_operation(eq, op,  :found), do: eval_operation(compute_eq(eq, op), op, :proceed)

  defp eval_operation(eq, op, :not_found) do
    cond do
      op == "/" -> eval_operation(eq, "*", :proceed)
      op == "*" -> eval_operation(eq, "+", :proceed)
      op == "+" -> eval_operation(eq, "-", :proceed)
      op == "-" -> eq
    end
  end

  defp evaluate_equation(equation) do
      Regex.replace(~r/\(([^()]+)\)/, equation, fn _, eq ->
      eval_operation(eq, "/", :proceed)
    end)
  end

  defp compute_eq(eq, op) do
    { _ , re_exp} = Regex.compile("(\\d+)(\\#{op})(\\d+)")
    Regex.replace(re_exp, eq, fn _, l, op, r -> "#{evaluate({str_to_int(l), op, str_to_int(r)})}" end)
  end

  defp evaluate({left, op, right}) do
    Kernel
    |> apply(String.to_atom(op), [left, right])
    |> round
  end


  defp pattern(regex, eq) do
    cond do
      Regex.match?(regex, eq) == true -> :found
      Regex.match?(regex, eq) == false -> :not_found
    end
  end

  defp str_to_int l do
    case Integer.parse(l) do
      {int, _ } -> int
    end
  end
end