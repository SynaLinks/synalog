SELECT
  JSON_EXTRACT(SPLIT('a,b', ','), '$[' || 5 || ']') AS s;