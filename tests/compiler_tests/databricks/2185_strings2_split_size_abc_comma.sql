SELECT
  ARRAY_SIZE(SPLIT("abc", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS n;
