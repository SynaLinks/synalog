SELECT
  ARRAY_LENGTH(SPLIT("aaa", "aa")) AS n,
  SPLIT("aaa", "aa")[OFFSET(0)] AS first,
  SPLIT("aaa", "aa")[OFFSET(((ARRAY_LENGTH(SPLIT("aaa", "aa"))) - (1)))] AS last;