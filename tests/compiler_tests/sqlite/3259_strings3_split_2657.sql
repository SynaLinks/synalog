SELECT
  JSON_ARRAY_LENGTH(SPLIT('x||y||', '||')) AS n,
  JSON_EXTRACT(SPLIT('x||y||', '||'), '$[' || 0 || ']') AS first,
  JSON_EXTRACT(SPLIT('x||y||', '||'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('x||y||', '||'))) - (1)) || ']') AS last;