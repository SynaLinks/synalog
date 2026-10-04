SELECT
  JSON_EXTRACT(JSON_ARRAY('x', 'y'), '$[' || 0 || ']') AS e;