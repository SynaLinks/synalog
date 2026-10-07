SELECT
  ARRAY_LENGTH(SPLIT("a,,b", ",")) AS n,
  ARRAY_TO_STRING(SPLIT("a,,b", ","), ",") AS s;