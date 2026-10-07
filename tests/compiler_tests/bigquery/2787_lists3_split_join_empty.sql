SELECT
  ARRAY_LENGTH(SPLIT("", ",")) AS n,
  ARRAY_TO_STRING(SPLIT("", ","), ",") AS s;