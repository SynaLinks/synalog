SELECT
  ARRAY_JOIN(SPLIT("abc", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1')), ",") AS s;
