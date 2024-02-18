defmodule JSONSchemaExtra.JSONSchema do
  @moduledoc """
  JSON Schema helper functions.
  """

  alias ExJsonSchema.Validator
  alias JSONSchemaExtra.ValidationError

  def validate(data, schema) do
    schema
    |> Validator.validate(data)
    |> Result.from(data)
  end

  def validate_fragment(data, schema, fragment) do
    schema
    |> Validator.validate_fragment(fragment, data)
    |> Result.from(data)
  end

  def validate!(data, schema) do
    case validate(data, schema) do
      {:ok, data} -> data
      {:error, errs} -> raise(ValidationError, errors: errs)
    end
  end

  def validate_fragment!(data, schema, fragment) do
    case validate_fragment(data, schema, fragment) do
      {:ok, data} -> data
      {:error, errs} -> raise(ValidationError, errors: errs)
    end
  end
end
