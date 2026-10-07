SELECT
  ARRAY_SIZE(SPLIT("a,b,c", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1'))) AS n,
  ARRAY_JOIN(SPLIT("a,b,c", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1')), ",") AS s;