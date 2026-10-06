SELECT
  ARRAY_LENGTH(SPLIT("a::b::c", "::")) AS n,
  SPLIT("a::b::c", "::")[OFFSET(0)] AS first,
  SPLIT("a::b::c", "::")[OFFSET(((ARRAY_LENGTH(SPLIT("a::b::c", "::"))) - (1)))] AS last;