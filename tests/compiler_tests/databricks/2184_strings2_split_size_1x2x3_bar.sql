SELECT
  ARRAY_SIZE(SPLIT("1|2|3", REGEXP_REPLACE("|", '([^a-zA-Z0-9])', '\\\\$1'))) AS n;
