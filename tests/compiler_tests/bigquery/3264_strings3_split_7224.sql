SELECT
  ARRAY_LENGTH(SPLIT("aaa", "aa")) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE SPLIT("aaa", "aa")[SAFE_OFFSET(0)] END) AS first,
  (CASE WHEN ((ARRAY_LENGTH(SPLIT("aaa", "aa"))) - (1)) < 0 THEN NULL ELSE SPLIT("aaa", "aa")[SAFE_OFFSET(((ARRAY_LENGTH(SPLIT("aaa", "aa"))) - (1)))] END) AS last;