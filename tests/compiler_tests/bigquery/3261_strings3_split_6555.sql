SELECT
  ARRAY_LENGTH(SPLIT("a$b", "$")) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE SPLIT("a$b", "$")[SAFE_OFFSET(0)] END) AS first,
  (CASE WHEN ((ARRAY_LENGTH(SPLIT("a$b", "$"))) - (1)) < 0 THEN NULL ELSE SPLIT("a$b", "$")[SAFE_OFFSET(((ARRAY_LENGTH(SPLIT("a$b", "$"))) - (1)))] END) AS last;