SELECT
  JSON_EXTRACT(SPLIT('a,b,c', ','), '$[' || 1 || ']') AS e;