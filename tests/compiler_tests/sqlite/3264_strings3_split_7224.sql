SELECT
  JSON_ARRAY_LENGTH(SPLIT('aaa', 'aa')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('aaa', 'aa'), '$[' || 0 || ']') END) AS first,
  (CASE WHEN ((JSON_ARRAY_LENGTH(SPLIT('aaa', 'aa'))) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('aaa', 'aa'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('aaa', 'aa'))) - (1)) || ']') END) AS last;