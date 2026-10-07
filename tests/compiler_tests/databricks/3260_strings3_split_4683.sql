SELECT
  ARRAY_SIZE(SPLIT("a(b)c", REGEXP_REPLACE("(", '([^a-zA-Z0-9])', '\\\\$1'))) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT("a(b)c", REGEXP_REPLACE("(", '([^a-zA-Z0-9])', '\\\\$1')), CAST(0 AS INT) + 1) END) AS first,
  (CASE WHEN ((ARRAY_SIZE(SPLIT("a(b)c", REGEXP_REPLACE("(", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT("a(b)c", REGEXP_REPLACE("(", '([^a-zA-Z0-9])', '\\\\$1')), CAST(((ARRAY_SIZE(SPLIT("a(b)c", REGEXP_REPLACE("(", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) AS INT) + 1) END) AS last;