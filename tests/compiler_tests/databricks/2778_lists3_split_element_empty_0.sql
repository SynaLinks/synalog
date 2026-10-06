SELECT
  ELEMENT_AT(SPLIT("", REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1')), 0 + 1) AS e;