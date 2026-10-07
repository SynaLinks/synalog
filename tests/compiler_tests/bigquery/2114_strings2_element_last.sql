SELECT
  (CASE WHEN ((ARRAY_LENGTH(SPLIT("a,b,c", ","))) - (1)) < 0 THEN NULL ELSE SPLIT("a,b,c", ",")[SAFE_OFFSET(((ARRAY_LENGTH(SPLIT("a,b,c", ","))) - (1)))] END) AS s;