defmodule CLI do
  @commands %{
    ".dbinfo" => Commands.PageSize
  }

  def main(args) do
    case args do
      [database_file_path, command] ->
        IO.inspect(command(command))

        case command do
          ".dbinfo" ->
            file = File.open!(database_file_path, [:read, :binary])

            # You can use print statements as follows for debugging, they'll be visible when running tests.
            IO.puts(:stderr, "Logs from your program will appear here!")

            # Skip the first 16 bytes of the header
            :file.position(file, 16)
            <<page_size::16>> = IO.binread(file, 2)
            IO.puts("database page size: #{page_size}")
        end

      _ ->
        IO.puts("Usage: your_program <database_file> <command>")
    end
  end

  defp command(command), do: Map.get(@commands, command)
end
