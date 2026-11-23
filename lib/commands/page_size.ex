defmodule Commands.PageSize do
  @behaviour Command

  @impl true
  def handle(database_file_path) do
    IO.inspect(database_file_path, label: "CALLED")
    file = File.open!(database_file_path, [:read, :binary])

    # You can use print statements as follows for debugging, they'll be visible when running tests.
    IO.puts(:stderr, "Logs from your program will appear here!")

    # Skip the first 16 bytes of the header
    :file.position(file, 16)
    <<page_size::16>> = IO.binread(file, 2)
    IO.puts("database page size: #{page_size}")
  end
end
