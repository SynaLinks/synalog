SELECT
  ELEMENT_AT(SPLIT("a,b,c", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1')), 1 + 1) AS e;