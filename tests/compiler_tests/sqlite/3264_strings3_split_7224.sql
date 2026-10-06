SELECT
  JSON_ARRAY_LENGTH(SPLIT('aaa', 'aa')) AS n,
  JSON_EXTRACT(SPLIT('aaa', 'aa'), '$[' || 0 || ']') AS first,
  JSON_EXTRACT(SPLIT('aaa', 'aa'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('aaa', 'aa'))) - (1)) || ']') AS last;