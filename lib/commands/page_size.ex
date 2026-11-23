defmodule Commands.PageSize do
  @behaviour Command

  @impl true
  def handle(database_file_path) do
    file = File.open!(database_file_path, [:read, :binary])

    IO.puts(:stderr, "Logs from your program will appear here!")

    # Skip the first 16 bytes of the header
    :file.position(file, 16)
    <<page_size::16>> = IO.binread(file, 2)
    IO.puts("database page size: #{page_size}")
  end
end
