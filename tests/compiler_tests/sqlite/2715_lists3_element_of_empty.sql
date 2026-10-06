SELECT
  JSON_EXTRACT(JSON_ARRAY(), '$[' || 0 || ']') AS e;