SELECT
  JSON_EXTRACT(SPLIT('', ','), '$[' || 0 || ']') AS e;