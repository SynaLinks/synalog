SELECT
  JSON_EXTRACT(SPLIT(',a,', ','), '$[' || 0 || ']') AS e;