defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/

  def split_line(line), do: Regex.split(~r/<[~*=-]*>/, line)

  def remove_artifacts(line), do: Regex.replace(~r/end\-of\-line[\d]+/i, line, "")

  def tag_with_user_name(line) do
    case Regex.scan(~r/User\s+(\S+)/u, line) do
      [[_, username]] -> "[USER] #{username} #{line}"
      _ -> line
    end
  end
end
