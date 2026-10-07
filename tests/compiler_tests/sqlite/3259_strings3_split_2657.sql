SELECT
  JSON_ARRAY_LENGTH(SPLIT('x||y||', '||')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('x||y||', '||'), '$[' || 0 || ']') END) AS first,
  (CASE WHEN ((JSON_ARRAY_LENGTH(SPLIT('x||y||', '||'))) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('x||y||', '||'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('x||y||', '||'))) - (1)) || ']') END) AS last;