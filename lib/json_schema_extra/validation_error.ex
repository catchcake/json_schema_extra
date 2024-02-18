defmodule JSONSchemaExtra.ValidationError do
  @moduledoc false

  defexception [:errors, :message]

  @impl true
  def message(%{message: nil} = exception), do: message(exception.errors)
  def message(%{message: message}), do: message

  def message(errors) when is_list(errors) do
    Enum.map_join(errors, "\n", fn {msg, path} -> "Error: '#{msg}' at '#{path}'" end)
  end
end
