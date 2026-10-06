SELECT
  ARRAY_LENGTH(SPLIT("x||y||", "||")) AS n,
  SPLIT("x||y||", "||")[OFFSET(0)] AS first,
  SPLIT("x||y||", "||")[OFFSET(((ARRAY_LENGTH(SPLIT("x||y||", "||"))) - (1)))] AS last;