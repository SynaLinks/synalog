SELECT
  ARRAY_LENGTH(SPLIT("x||y||", "||")) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE SPLIT("x||y||", "||")[SAFE_OFFSET(0)] END) AS first,
  (CASE WHEN ((ARRAY_LENGTH(SPLIT("x||y||", "||"))) - (1)) < 0 THEN NULL ELSE SPLIT("x||y||", "||")[SAFE_OFFSET(((ARRAY_LENGTH(SPLIT("x||y||", "||"))) - (1)))] END) AS last;