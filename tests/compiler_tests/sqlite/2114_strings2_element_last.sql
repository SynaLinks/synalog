SELECT
  (CASE WHEN ((JSON_ARRAY_LENGTH(SPLIT('a,b,c', ','))) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('a,b,c', ','), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('a,b,c', ','))) - (1)) || ']') END) AS s;