SELECT
  ARRAY_LENGTH(SPLIT("a,b,c", ",")) AS n,
  ARRAY_TO_STRING(SPLIT("a,b,c", ","), ",") AS s;