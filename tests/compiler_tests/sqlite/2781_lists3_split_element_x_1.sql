SELECT
  JSON_EXTRACT(SPLIT('x', ','), '$[' || 1 || ']') AS e;