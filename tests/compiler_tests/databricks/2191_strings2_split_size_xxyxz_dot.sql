SELECT
  ARRAY_SIZE(SPLIT("x.y.z", REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1'))) AS n;
