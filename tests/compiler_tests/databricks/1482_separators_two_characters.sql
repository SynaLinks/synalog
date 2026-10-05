SELECT
  SPLIT("a::b::c", REGEXP_REPLACE("::", '([^a-zA-Z0-9])', '\\\\$1')) AS parts;
