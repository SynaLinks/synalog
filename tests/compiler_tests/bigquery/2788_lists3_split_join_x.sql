SELECT
  ARRAY_LENGTH(SPLIT("x", ",")) AS n,
  ARRAY_TO_STRING(SPLIT("x", ","), ",") AS s;