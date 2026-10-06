SELECT
  ARRAY_LENGTH(SPLIT("a*b", "*")) AS n,
  SPLIT("a*b", "*")[OFFSET(0)] AS first,
  SPLIT("a*b", "*")[OFFSET(((ARRAY_LENGTH(SPLIT("a*b", "*"))) - (1)))] AS last;