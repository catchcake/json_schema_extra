defmodule JSONSchemaExtra do
  @moduledoc false

  alias JSONSchemaExtra.JSONSchema

  defdelegate validate(data, schema), to: JSONSchema

  defdelegate validate_fragment(data, schema, fragment), to: JSONSchema

  defdelegate validate!(data, schema), to: JSONSchema

  defdelegate validate_fragment!(data, schema, fragment), to: JSONSchema
end
