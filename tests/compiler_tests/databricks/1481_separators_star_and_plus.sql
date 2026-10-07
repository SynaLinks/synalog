SELECT
  SPLIT("a*b", REGEXP_REPLACE("*", '([^a-zA-Z0-9])', '\\\\$1')) AS a,
  SPLIT("x+y", REGEXP_REPLACE("+", '([^a-zA-Z0-9])', '\\\\$1')) AS b,
  SPLIT("p|q", REGEXP_REPLACE("|", '([^a-zA-Z0-9])', '\\\\$1')) AS c;
