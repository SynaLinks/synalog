SELECT
  ARRAY_TO_STRING(SPLIT("a::b::c", "::"), "::") AS s;