SELECT
  JSON_EXTRACT(SPLIT('x', ','), '$[' || 0 || ']') AS e;