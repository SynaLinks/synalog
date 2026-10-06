SELECT
  JSON_EXTRACT(SPLIT('', ','), '$[' || 1 || ']') AS e;