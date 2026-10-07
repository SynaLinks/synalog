SELECT
  ARRAY_SIZE(SPLIT(",", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS n,
  ARRAY_JOIN(SPLIT(",", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1')), ",") AS s;