SELECT
  JSON_ARRAY_LENGTH(SPLIT('a$b', '$')) AS n,
  JSON_EXTRACT(SPLIT('a$b', '$'), '$[' || 0 || ']') AS first,
  JSON_EXTRACT(SPLIT('a$b', '$'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('a$b', '$'))) - (1)) || ']') AS last;