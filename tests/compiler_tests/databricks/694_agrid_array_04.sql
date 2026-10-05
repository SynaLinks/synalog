SELECT
  ELEMENT_AT(SPLIT("x;y;z", REGEXP_REPLACE(";", '([^a-zA-Z0-9])', '\\\\$1')), 2 + 1) AS v;
