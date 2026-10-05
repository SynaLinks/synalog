SELECT
  ARRAY_JOIN(SPLIT("a-b", REGEXP_REPLACE("-", '([^a-zA-Z0-9])', '\\\\$1')), "+") AS v;
