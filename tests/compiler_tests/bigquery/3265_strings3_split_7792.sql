SELECT
  ARRAY_LENGTH(SPLIT("a::b::c", "::")) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE SPLIT("a::b::c", "::")[SAFE_OFFSET(0)] END) AS first,
  (CASE WHEN ((ARRAY_LENGTH(SPLIT("a::b::c", "::"))) - (1)) < 0 THEN NULL ELSE SPLIT("a::b::c", "::")[SAFE_OFFSET(((ARRAY_LENGTH(SPLIT("a::b::c", "::"))) - (1)))] END) AS last;