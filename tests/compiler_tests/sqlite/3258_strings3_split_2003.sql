SELECT
  JSON_ARRAY_LENGTH(SPLIT('a^b', '^')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('a^b', '^'), '$[' || 0 || ']') END) AS first,
  (CASE WHEN ((JSON_ARRAY_LENGTH(SPLIT('a^b', '^'))) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('a^b', '^'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('a^b', '^'))) - (1)) || ']') END) AS last;