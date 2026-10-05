SELECT
  SPLIT("a,b,c", ",")[OFFSET(((ARRAY_LENGTH(SPLIT("a,b,c", ","))) - (1)))] AS s;