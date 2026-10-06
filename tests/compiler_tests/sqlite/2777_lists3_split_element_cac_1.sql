SELECT
  JSON_EXTRACT(SPLIT(',a,', ','), '$[' || 1 || ']') AS e;