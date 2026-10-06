SELECT
  ARRAY_LENGTH(SPLIT(",a,", ",")) AS n,
  ARRAY_TO_STRING(SPLIT(",a,", ","), ",") AS s;