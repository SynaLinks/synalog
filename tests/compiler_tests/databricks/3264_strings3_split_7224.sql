SELECT
  ARRAY_SIZE(SPLIT("aaa", REGEXP_REPLACE("aa", '([^a-zA-Z0-9])', '\\\\$1'))) AS n,
  ELEMENT_AT(SPLIT("aaa", REGEXP_REPLACE("aa", '([^a-zA-Z0-9])', '\\\\$1')), 0 + 1) AS first,
  ELEMENT_AT(SPLIT("aaa", REGEXP_REPLACE("aa", '([^a-zA-Z0-9])', '\\\\$1')), ((ARRAY_SIZE(SPLIT("aaa", REGEXP_REPLACE("aa", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) + 1) AS last;