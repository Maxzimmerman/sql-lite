defmodule CLI do
  @commands %{
    ".dbinfo" => Commands.PageSize
  }

  def main(args) do
    case args do
      [database_file_path, command] ->
        command(command).handle(database_file_path)

      _ ->
        IO.puts("Usage: your_program <database_file> <command>")
    end
  end

  defp command(command), do: Map.get(@commands, command)
end
