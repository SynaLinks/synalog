SELECT
  JSON_EXTRACT(SPLIT('a,b,c', ','), '$[' || 0 || ']') AS e;