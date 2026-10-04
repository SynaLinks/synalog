SELECT
  JSON_EXTRACT(JSON_ARRAY(1, 2), '$[' || 5 || ']') AS e;