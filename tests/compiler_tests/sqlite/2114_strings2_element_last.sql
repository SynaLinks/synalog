SELECT
  JSON_EXTRACT(SPLIT('a,b,c', ','), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('a,b,c', ','))) - (1)) || ']') AS s;