defmodule JSONSchemaTest do
  use ExUnit.Case
  doctest JSONSchemaExtra.JSONSchema

  alias JSONSchemaExtra.JSONSchema
  alias Result, as: R

  test "validate/2 - should return ok" do
    schema = %{
      "type" => "object",
      "required" => ["name", "value"],
      "properties" => %{
        "name" => %{"type" => "string"},
        "value" => %{"type" => "number"}
      }
    }

    data = %{
      "name" => "foo",
      "value" => 1.23
    }

    assert R.ok?(JSONSchema.validate(data, schema))
  end
end
