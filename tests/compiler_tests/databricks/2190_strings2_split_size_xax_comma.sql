SELECT
  ARRAY_SIZE(SPLIT(",a,", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS n;
